# profiles/container-host.nix
# Configurazione per un host che esegue container con Podman.
{
  imports = [ ./minimal.nix ];

  # Abilita Podman
  virtualisation.podman = {
    enable = true;

    # Abilita il socket Docker-compatible per usare tool come docker-compose
    dockerCompat = true;

    # Abilita il supporto per default network
    defaultNetwork.settings.dns_enabled = true;
  };

  # Aggiungi l'utente admin ai gruppi pertinenti per la gestione rootless
  users.users.admin.extraGroups = [ "podman" ];

  # Aggiungi pacchetti di supporto, come docker-compose (che userà il socket di Podman)
  environment.systemPackages = [ pkgs.docker-compose ];
}
