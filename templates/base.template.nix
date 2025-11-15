# templates/base.template.nix
# Template di base per la generazione del flake.nix
{
  description = "NixOS Configuration for your-hostname";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, nixos-hardware, ... }:
  {
    nixosConfigurations = {
      "your-hostname" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Importa il profilo specifico
          ./profiles/your-profile.nix

          # Applica le personalizzazioni dall'utente
          ({
            networking.hostName = "your-hostname";
            time.timeZone = "your-timezone";
            users.users.root.openssh.authorizedKeys.keys = [ "your-ssh-key" ];
            users.users.admin.name = "your-username";
            users.users.admin.openssh.authorizedKeys.keys = [ "your-ssh-key" ];
          })
        ];
      };
    };
  };
}
