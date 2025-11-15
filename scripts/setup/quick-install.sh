#!/bin/bash

# NixOS Hetzner VPS Quick Installation Script
# Questo script è per utenti avanzati che desiderano un setup non interattivo.

# --- Configurazione ---
CONFIG_FILE="flake.nix"
TEMPLATE_DIR="templates"

# --- Colori e Stili ---
C_BLUE="\033[1;34m"
C_GREEN="\033[1;32m"
C_RED="\033[1;31m"
C_RESET="\033[0m"

# --- Funzioni di utilità ---
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

function usage() {
  echo "Uso: $0 --hostname <nome> --profile <profilo> --ssh-key <chiave> [--username <utente>] [--timezone <tz>]"
  echo "Profili disponibili: minimal, webserver, container-host"
  exit 1
}

# --- Logica Principale ---
function main() {
  # Parsing degli argomenti
  while [[ "$#" -gt 0 ]]; do
    case $1 in
      --hostname) HOSTNAME="$2"; shift ;;
      --profile) PROFILE="$2"; shift ;;
      --ssh-key) SSH_KEY="$2"; shift ;;
      --username) USERNAME="$2"; shift ;;
      --timezone) TIMEZONE="$2"; shift ;;
      *) echo "Parametro non riconosciuto: $1"; usage ;;
    esac
    shift
  done

  # Valori di default per i parametri opzionali
  USERNAME=${USERNAME:-"admin"}
  TIMEZONE=${TIMEZONE:-"Europe/Berlin"}

  # Validazione degli argomenti obbligatori
  if [ -z "$HOSTNAME" ] || [ -z "$PROFILE" ] || [ -z "$SSH_KEY" ]; then
    error "Argomenti obbligatori mancanti."
    usage
  fi

  prompt "Avvio installazione rapida..."

  # 1. Controlla configurazione esistente
  if [ -f "$CONFIG_FILE" ]; then
    error "Trovato file di configurazione esistente ($CONFIG_FILE). Rimuoverlo prima di continuare."
  fi

  # 2. Valida il profilo
  local profile_template="$TEMPLATE_DIR/by-profile/${PROFILE}.template.nix"
  if [ ! -f "$profile_template" ]; then
    error "Profilo non valido: '$PROFILE'. Scegliere tra 'minimal', 'webserver', 'container-host'."
  fi

  # 3. Genera la configurazione
  prompt "Generazione del file di configurazione per il profilo '$PROFILE'..."
  cp "$profile_template" "$CONFIG_FILE"

  sed -i "s/your-hostname/$HOSTNAME/g" "$CONFIG_FILE"
  sed -i "s/your-username/$USERNAME/g" "$CONFIG_FILE"
  sed -i "s|your-timezone|$TIMEZONE|g" "$CONFIG_FILE"
  # Uso un delimitatore diverso per la chiave SSH per evitare problemi con gli slash
  sed -i "s|your-ssh-key|$SSH_KEY|g" "$CONFIG_FILE"

  success "File di configurazione '$CONFIG_FILE' creato con successo per l'hostname '$HOSTNAME'!"
  echo
  prompt "Prossimi passi:"
  echo "1. Rivedi il file generato: cat $CONFIG_FILE"
  echo "2. Esegui il deploy sul tuo server Hetzner (da lanciare sul server in rescue mode):"
  echo "   nixos-rebuild switch --flake .#$HOSTNAME"
  echo
}

main
