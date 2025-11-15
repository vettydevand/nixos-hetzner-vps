# templates/by-profile/minimal.template.nix
# Template per il profilo minimal
{
  description = "NixOS Configuration for ${HOSTNAME}";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, nixos-hardware, ... }:
  {
    nixosConfigurations = {
      "${HOSTNAME}" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./profiles/minimal.nix
          nixos-hardware.nixosModules.hetzner-cloud

          ({
            networking.hostName = "${HOSTNAME}";
            time.timeZone = "${TIMEZONE}";
            users.users.root.openssh.authorizedKeys.keys = [ "${SSH_KEY_CONTENT}" ];
            users.users.admin = {
              name = "${ADMIN_USERNAME}";
              isNormalUser = true;
              extraGroups = [ "wheel" ];
              openssh.authorizedKeys.keys = [ "${SSH_KEY_CONTENT}" ];
            };
          })
        ];
      };
    };
  };
}
