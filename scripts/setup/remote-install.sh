#!/bin/bash

# Script di installazione remota per NixOS su Hetzner VPS
# Questo script viene eseguito nel sistema di rescue.

# --- Funzioni di utilità ---
function log() { echo "[REMOTE] $1"; }

# --- Logica Principale ---
log "Avvio installazione remota di NixOS..."

# 1. Partiziona il disco
log "Partizionamento del disco /dev/sda..."
parted /dev/sda --script -- mklabel gpt \
  mkpart primary 512MiB -2GiB \
  mkpart primary linux-swap -2GiB 100% \
  mkpart ESP fat32 1MiB 512MiB \
  set 3 esp on

# 2. Formatta i filesystem
log "Formattazione dei filesystem..."
mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3

# 3. Monta i filesystem
log "Montaggio dei filesystem in /mnt..."
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/sda2

# 4. Installa NixOS
log "Installazione di NixOS..."
nixos-install --no-root-passwd --flake "github:vettydevand/nixos-hetzner-vps#$HOSTNAME"

log "Installazione completata. Riavvio in corso..."
reboot
