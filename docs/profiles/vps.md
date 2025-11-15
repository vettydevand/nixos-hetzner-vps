# VPS Profile

The `vps` profile is a general-purpose profile for a virtual private server.

## Included Modules

- `base.nix`
- `hardware.nix`
- `network.nix`
- `podman.nix`
- `security.nix`
- `storage.nix`

## Features

This profile provides a good starting point for a typical VPS. It includes:

- A hardened Linux kernel.
- A restrictive firewall.
- Rootless containers with Podman.
- Full-disk encryption with LUKS and ZFS.

## Usage

To use this profile, set the `profile` attribute in your `flake.nix` to `vps`.

```nix
# flake.nix

{
  # ...
  outputs = { ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations = {
        your-hostname = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs; }; # Pass pkgs to modules
          modules = [
            {
              profiles.vps.enable = true;
            }
            # ... other modules
          ];
        };
      };
    };
}
```
