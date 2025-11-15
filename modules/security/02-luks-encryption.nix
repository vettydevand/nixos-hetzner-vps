# modules/security/02-luks-encryption.nix
# Modulo per abilitare la crittografia dell'intero disco con LUKS.
# ATTENZIONE: Questa configurazione richiede un'installazione manuale o uno script di setup specifico
# che partizioni e formatti il disco con LUKS prima di avviare nixos-install.

{ config, lib, pkgs, ... }:

{
  # Questo modulo assume che la partizione radice sia un dispositivo LUKS mappato.
  # La configurazione va inserita nel file hardware-configuration.nix durante l'installazione.
  # Esempio per il file di configurazione hardware:
  # boot.initrd.luks.devices = {
  #   root = {
  #     device = "/dev/disk/by-uuid/YOUR-LUKS-PARTITION-UUID";
  #     preLVM = true;
  #   };
  # };

  # Includi i pacchetti necessari nel sistema di boot iniziale (initrd)
  # per sbloccare la partizione crittografata all'avvio.
  boot.initrd.systemd.enable = true;

  # Aggiungi un messaggio nel MOTD per notificare che il sistema è crittografato
  services.motd.contents = lib.mkAfter "\n🔒 System disk is encrypted with LUKS.\n";

  # Aggiungi strumenti di gestione LUKS al sistema principale
  environment.systemPackages = [ pkgs.cryptsetup ];
}
