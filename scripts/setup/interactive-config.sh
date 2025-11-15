#!/usr/bin/env bash

# NixOS Hetzner VPS Interactive Configuration Wizard - SECURE & USER-FRIENDLY

# --- Color Codes ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# --- Helper Functions ---
function print_header() { echo -e "${BLUE}=====================================================\n 🚀 NixOS Hetzner VPS Interactive Configuration 🚀\n=====================================================${NC}\n"; }
function print_step() { echo -e "\n${YELLOW}➡️  $1${NC}"; }
function get_input() { read -p "$1 [$2]: " input; eval $3='${input:-$2}'; }
function confirm() { read -p "${YELLOW}$1 [y/N]: ${NC}" confirm; [[ "$confirm" == "y" || "$confirm" == "Y" ]]; }

# --- Main Script ---
clear
print_header

# --- User Input ---
print_step "Gathering Configuration Details"

get_input "Enter server hostname" "nixos-server" SERVER_HOSTNAME
get_input "Enter admin username" "admin" ADMIN_USERNAME
get_input "Enter your timezone" "Europe/Berlin" TIMEZONE

# Secure SSH Key Selection
print_step "SSH Key Selection"
ssh_keys=(~/.ssh/id_*.pub)
if [ ${#ssh_keys[@]} -eq 0 ]; then
    echo "Nessuna chiave SSH trovata in ~/.ssh. Creane una ora."
    ssh-keygen -t ed25519
    ssh_keys=(~/.ssh/id_*.pub)
fi
echo "Scegli una chiave SSH da usare:"
select key_file in "${ssh_keys[@]}"; do
    if [ -n "$key_file" ]; then break; fi
done
export SSH_KEY_CONTENT=$(cat "$key_file")

# --- Profile Selection ---
print_step "Choosing Deployment Profile"
select PROFILE in "minimal" "webserver" "container-host" "full-stack"; do
  if [ -n "$PROFILE" ]; then break; fi
done

# --- Generate Configuration ---
print_step "Generating NixOS Configuration"
TEMPLATE_FILE="templates/by-profile/${PROFILE}.template.nix"
OUTPUT_FILE="flake.nix"

export SERVER_HOSTNAME ADMIN_USERNAME TIMEZONE
envsubst < "$TEMPLATE_FILE" > "$OUTPUT_FILE"

echo -e "${GREEN}✅ Configuration generated at $OUTPUT_FILE${NC}"

# --- Review and Confirm ---
print_step "Review Your Configuration"
cat $OUTPUT_FILE

if ! confirm "\nDoes this configuration look correct? Proceed with installation?"; then
    echo -e "${RED}Aborted.${NC}"
    exit 1
fi

# --- Automated Installation ---
print_step "Starting Installation"

if confirm "Do you want to run the automated Hetzner installation? (Requires hcloud CLI)"; then
    get_input "Enter your Hetzner API token" "" HETZNER_TOKEN
    if [ -z "$HETZNER_TOKEN" ]; then echo -e "${RED}Hetzner token is required for automated installation.${NC}"; exit 1; fi
    
    ./scripts/setup/quick-install.sh --hostname "$SERVER_HOSTNAME" --profile "$PROFILE" --ssh-key-file "$key_file" --hetzner-token "$HETZNER_TOKEN"
else
    echo "Please run the installation manually on your Hetzner server in rescue mode:"
    echo "nixos-rebuild switch --flake .#$SERVER_HOSTNAME"
fi

exit 0
