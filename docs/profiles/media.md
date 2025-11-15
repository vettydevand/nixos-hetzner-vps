# Media Profile

The `media` profile is optimized for a media server.

## Included Modules

- `base.nix`
- `hardware.nix` (with `hardware.profile` set to `media`)
- `network.nix`
- `security.nix`
- `storage.nix`

## Features

This profile is similar to the `vps` profile, but with a few key differences:

- The I/O scheduler is optimized for streaming large files.
- The ZFS ARC size is increased to improve read performance.
- Podman is included for running media server applications like Plex or Jellyfin in containers.

## Usage

To use this profile, set the `profile` attribute in your `flake.nix` to `media`.

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
              profiles.media.enable = true;
            }
            # ... other modules
          ];
        };
      };
    };
}
```
