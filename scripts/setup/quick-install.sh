#!/bin/bash

# NixOS Hetzner VPS Quick Installation Script - SECURE AND AUTOMATED

# --- Configurazione ---
CONFIG_FILE="flake.nix"
TEMPLATE_DIR="templates"

# --- Colori e Stili ---
C_BLUE="\033[1;34m"
C_GREEN="\033[1;32m"
C_RED="\033[1;31m"
C_RESET="\033[0m"

# --- Funzioni di utilità ---
function prompt() { echo -e "${C_BLUE}==>${C_RESET} ${1}"; }
function success() { echo -e "${C_GREEN} ✓ ${C_RESET} ${1}"; }
function error() { echo -e "${C_RED} ✗ ${C_RESET} ${1}"; exit 1; }

function usage() {
  echo "Uso: $0 --hostname <nome> --profile <profilo> [--ssh-key-file <percorso>] [--username <utente>] [--timezone <tz>] [--hetzner-token <token>]"
  echo "Profili disponibili: minimal, webserver, container-host, full-stack"
  exit 1;
}

# --- Logica Principale ---
function main() {
  # Parsing degli argomenti
  while [[ "$#" -gt 0 ]]; do
    case $1 in
      --hostname) HOSTNAME="$2"; shift ;;
      --profile) PROFILE="$2"; shift ;;
      --ssh-key-file) SSH_KEY_FILE="$2"; shift ;;
      --username) USERNAME="$2"; shift ;;
      --timezone) TIMEZONE="$2"; shift ;;
      --hetzner-token) HETZNER_TOKEN="$2"; shift ;;
      *) echo "Parametro non riconosciuto: $1"; usage ;;
    esac
    shift
  done

  # Valori di default e validazione
  USERNAME=${USERNAME:-"admin"}
  TIMEZONE=${TIMEZONE:-"Europe/Berlin"}
  SSH_KEY_FILE=${SSH_KEY_FILE:-"$HOME/.ssh/id_rsa.pub"}

  if [ -z "$HOSTNAME" ] || [ -z "$PROFILE" ]; then error "Argomenti obbligatori mancanti." && usage; fi

  # Validazione della chiave SSH
  if [ ! -f "$SSH_KEY_FILE" ]; then error "File della chiave SSH non trovato: $SSH_KEY_FILE"; fi
  local ssh_key_content=$(cat "$SSH_KEY_FILE")
  if ! [[ "$ssh_key_content" == ssh-rsa* || "$ssh_key_content" == ssh-ed25519* ]]; then error "Formato chiave SSH non valido"; fi

  prompt "Avvio installazione rapida sicura..."

  # Generazione della configurazione sicura
  local template_path="$TEMPLATE_DIR/by-profile/${PROFILE}.template.nix"
  if [ ! -f "$template_path" ]; then error "Profilo non valido: '$PROFILE'"; fi

  export HOSTNAME USERNAME TIMEZONE SSH_KEY_CONTENT="$ssh_key_content"
  envsubst < "$template_path" > "$CONFIG_FILE"
    
  success "File di configurazione '$CONFIG_FILE' generato in modo sicuro per l'hostname '$HOSTNAME'!"

  # Automazione Hetzner
  if [ -n "$HETZNER_TOKEN" ]; then
    prompt "Avvio automazione Hetzner..."
    if ! command -v hcloud &> /dev/null; then error "Comando 'hcloud' non trovato. Installare Hetzner Cloud CLI."; fi
    hcloud context create --token "$HETZNER_TOKEN" temp-context &> /dev/null
    hcloud context use temp-context

    # Esegui l'installazione in rescue mode
    hcloud server enable-rescue -t ssh "$HOSTNAME"
    ssh root@$HOSTNAME "bash -s" < scripts/setup/remote-install.sh
    hcloud server disable-rescue "$HOSTNAME"
    hcloud server reboot "$HOSTNAME"

    success "Installazione automatica completata per '$HOSTNAME'!"
  else
    prompt "Per l'installazione automatica, fornire --hetzner-token."
  fi

  echo
}

main
