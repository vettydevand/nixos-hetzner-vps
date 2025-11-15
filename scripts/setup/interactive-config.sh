#!/usr/bin/env bash

# NixOS Hetzner VPS Interactive Configuration Wizard

# --- Color Codes ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# --- Helper Functions ---
function print_header() {
    echo -e "${BLUE}====================================================="
    echo -e " 🚀 NixOS Hetzner VPS Interactive Configuration 🚀"
    echo -e "=====================================================${NC}"
    echo
}

function print_step() {
    echo -e "\n${YELLOW}➡️  $1${NC}"
}

function get_input() {
    local prompt="$1"
    local default="$2"
    local var_name="$3"
    
    read -p "$prompt [$default]: " input
    eval $var_name='${input:-$default}'
}

function confirm_action() {
    read -p "${YELLOW}$1 [y/N]: ${NC}" confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo -e "${RED}Aborted.${NC}"
        exit 1
    fi
}

# --- Main Script ---
clear
print_header

# --- User Input ---
print_step "Gathering Configuration Details"

get_input "Enter server hostname" "nixos-server" SERVER_HOSTNAME
get_input "Enter admin username" "admin" ADMIN_USERNAME
get_input "Enter your timezone" "Europe/Berlin" TIMEZONE

echo -e "\n${BLUE}Please provide your SSH public key for admin access.${NC}"
read -p "SSH Public Key: " SSH_PUBLIC_KEY

if [ -z "$SSH_PUBLIC_KEY" ]; then
    echo -e "${RED}SSH public key is required. Aborting.${NC}"
    exit 1
fi

print_step "Choosing Deployment Profile"
echo "Select a pre-configured profile for your server:"
echo "  1. Minimal (basic secure server)"
echo "  2. Web Server (Nginx, Caddy, SSL)"
echo "  3. Container Host (Podman, Docker-compatible)"
echo "  4. Database Server (PostgreSQL, MySQL)"
echo "  5. Full Stack (all of the above)"
read -p "Choose profile [1-5]: " profile_choice

case $profile_choice in
    1) PROFILE="minimal";;    
    2) PROFILE="webserver";;    
    3) PROFILE="container-host";;    
    4) PROFILE="database-server";;    
    5) PROFILE="full-stack";;    
    *) echo -e "${RED}Invalid choice. Defaulting to minimal.${NC}"; PROFILE="minimal";;
esac

# --- Generate Configuration ---
print_step "Generating NixOS Configuration"

TEMPLATE_FILE="templates/by-profile/${PROFILE}.template.nix"
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo -e "${RED}Template file not found: $TEMPLATE_FILE. Aborting.${NC}"
    exit 1
fi

OUTPUT_FILE="flake.nix"

cp "$TEMPLATE_FILE" "$OUTPUT_FILE"

sed -i "s|__HOSTNAME__|$SERVER_HOSTNAME|g" "$OUTPUT_FILE"
sed -i "s|__USERNAME__|$ADMIN_USERNAME|g" "$OUTPUT_FILE"
sed -i "s|__TIMEZONE__|$TIMEZONE|g" "$OUTPUT_FILE"
sed -i "s|__SSH_KEY__|$SSH_PUBLIC_KEY|g" "$OUTPUT_FILE"

echo -e "${GREEN}✅ Configuration generated successfully at $OUTPUT_FILE${NC}"

# --- Review and Confirm ---
print_step "Review Your Configuration"

cat $OUTPUT_FILE

confirm_action "\nDoes this configuration look correct? Proceed with installation?"

# --- Installation ---
print_step "Starting Installation"

# Check for Hetzner environment
if ! grep -q "Hetzner" /sys/class/dmi/id/sys_vendor; then
    echo -e "${YELLOW}⚠️  Warning: Not running on a Hetzner server. Installation might fail.${NC}"
    confirm_action "Continue anyway?"
fi

echo -e "${BLUE}Running the quick installer... This may take some time.${NC}"
./scripts/setup/quick-install.sh

if [ $? -eq 0 ]; then
    echo -e "\n${GREEN}🎉 Installation successful! 🎉${NC}"
    echo -e "Your server will reboot shortly. You can then connect with:"
    echo -e "  ${BLUE}ssh ${ADMIN_USERNAME}@${SERVER_HOSTNAME}${NC}"
else
    echo -e "\n${RED}❌ Installation failed. Please check the logs for errors.${NC}"
    exit 1
fi

exit 0
