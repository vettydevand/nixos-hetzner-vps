# Database Profile

The `database` profile is optimized for running a database server.

## Included Modules

- `base.nix`
- `hardware.nix` (with `hardware.profile` set to `database`)
- `network.nix`
- `security.nix`
- `storage.nix`

## Features

This profile is similar to the `vps` profile, but with a few key differences:

- The I/O scheduler is optimized for database workloads.
- The ZFS ARC size is increased to give more memory to the filesystem cache.
- Podman is not included by default, as it is not typically needed on a database server.

## Usage

To use this profile, set the `profile` attribute in your `flake.nix` to `database`.

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
              profiles.database.enable = true;
            }
            # ... other modules
          ];
        };
      };
    };
}
```
