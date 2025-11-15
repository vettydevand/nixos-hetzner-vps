# profiles/full-stack.nix
#
# Profilo completo con webserver, container e strumenti di sviluppo.

{
  imports = [
    ./webserver.nix
    ./container-host.nix
  ];

  environment.systemPackages = with pkgs; [
    nodejs_20
    go
  ];
}
