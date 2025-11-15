# templates/by-profile/minimal.template.nix
# Template per il profilo minimal
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
          ./profiles/minimal.nix
          nixos-hardware.nixosModules.hetzner-cloud

          ({
            networking.hostName = "your-hostname";
            time.timeZone = "your-timezone";
            users.users.root.openssh.authorizedKeys.keys = [ "your-ssh-key" ];
            users.users.admin = {
              name = "your-username";
              isNormalUser = true;
              extraGroups = [ "wheel" ];
              openssh.authorizedKeys.keys = [ "your-ssh-key" ];
            };
          })
        ];
      };
    };
  };
}
