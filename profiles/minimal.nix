# profiles/minimal.nix
# Configurazione di base per qualsiasi server NixOS.
{ config, pkgs, ... }:

{
  imports = [
    # Importa i moduli di base del progetto per hardware e storage.
    ../modules/base/00-hardware.nix
    # ../modules/storage/01-zfs-pool.nix # Commentato di default
  ];

  # Impostazioni di base di NixOS
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-hetzner"; # Placeholder - verrà sovrascritto

  # Fuso orario
  time.timeZone = "Europe/Berlin"; # Placeholder

  # Localizzazione
  i18n.defaultLocale = "en_US.UTF-8";

  # Servizi di base
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  # Gestione utenti
  users.users.root.openssh.authorizedKeys.keys = [
    # Placeholder per la chiave SSH
  ];

  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Per i permessi di sudo
    openssh.authorizedKeys.keys = [
      # Placeholder per la chiave SSH
    ];
  };

  # Pacchetti di sistema essenziali
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
    htop
  ];

  # Abilita il garbage collector di Nix per pulire le vecchie generazioni
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  system.stateVersion = "24.05";
}
