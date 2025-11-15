# templates/by-profile/full-stack.template.nix
# Template per il profilo full-stack
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
          ./profiles/full-stack.nix
          nixos-hardware.nixosModules.hetzner-cloud

          ({
            networking.hostName = "${HOSTNAME}";
            time.timeZone = "${TIMEZONE}";
            users.users.root.openssh.authorizedKeys.keys = [ "${SSH_KEY_CONTENT}" ];
            users.users.admin = {
              name = "${ADMIN_USERNAME}";
              isNormalUser = true;
              extraGroups = [ "wheel" "docker" ];
              openssh.authorizedKeys.keys = [ "${SSH_KEY_CONTENT}" ];
            };
          })
        ];
      };
    };
  };
}
