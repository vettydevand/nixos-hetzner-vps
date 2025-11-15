#!/bin/bash

# NixOS Hetzner VPS Interactive Configuration Wizard
# This script guides users through creating a personalized NixOS configuration.

# --- Configuration ---
CONFIG_FILE="flake.nix"
TEMPLATE_DIR="templates"
BASE_TEMPLATE="$TEMPLATE_DIR/base.template.nix"

# --- Colors and Styles ---
C_BLUE="\033[1;34m"
C_GREEN="\033[1;32m"
C_RED="\033[1;31m"
C_YELLOW="\033[1;33m"
C_RESET="\033[0m"

# --- Helper Functions ---
function prompt() {
  echo -e "${C_BLUE}==>${C_RESET} ${1}"
}

function success() {
  echo -e "${C_GREEN} ✓ ${C_RESET} ${1}"
}

function error() {
  echo -e "${C_RED} ✗ ${C_RESET} ${1}"
  exit 1
}

function warn() {
  echo -e "${C_YELLOW} ! ${C_RESET} ${1}"
}

function get_input() {
  local prompt_text=$1
  local default_value=$2
  local user_input

  read -p "$(prompt "${prompt_text} [${default_value}]: ")" user_input
  echo "${user_input:-$default_value}"
}

# --- Main Logic ---
function main() {
  clear
  echo -e "${C_BLUE}##################################################${C_RESET}"
  echo -e "${C_BLUE}# NixOS Hetzner VPS Interactive Configuration  #${C_RESET}"
  echo -e "${C_BLUE}##################################################${C_RESET}"
  echo

  # 1. Check for existing configuration
  if [ -f "$CONFIG_FILE" ]; then
    warn "An existing configuration file ($CONFIG_FILE) was found."
    local overwrite
    overwrite=$(get_input "Do you want to overwrite it? (yes/no)" "no")
    if [[ "$overwrite" != "yes" ]]; then
      error "Configuration cancelled."
    fi
  fi

  # 2. Gather user input
  local hostname=$(get_input "Enter the server hostname" "nixos-hetzner")
  local username=$(get_input "Enter the admin username" "admin")
  local timezone=$(get_input "Enter the timezone" "Europe/Berlin")
  local ssh_key=$(get_input "Enter your public SSH key" "ssh-ed25519 ...")
  local profile=$(get_input "Choose a profile (minimal, webserver, container-host)" "webserver")

  # 3. Validate profile
  local profile_template="$TEMPLATE_DIR/by-profile/${profile}.template.nix"
  if [ ! -f "$profile_template" ]; then
    error "Invalid profile selected. Please choose from 'minimal', 'webserver', or 'container-host'."
  fi

  # 4. Generate configuration
  prompt "Generating configuration file..."
  cp "$profile_template" "$CONFIG_FILE"

  sed -i "s/your-hostname/$hostname/g" "$CONFIG_FILE"
  sed -i "s/your-username/$username/g" "$CONFIG_FILE"
  sed -i "s|your-timezone|$timezone|g" "$CONFIG_FILE"
  sed -i "s|your-ssh-key|$ssh_key|g" "$CONFIG_FILE"

  success "Configuration file '$CONFIG_FILE' created successfully!"
  echo
  warn "Please review the generated file before proceeding with the installation."
  echo
}

main
