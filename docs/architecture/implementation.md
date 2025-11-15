# Implementation Details

This document describes the technical implementation of the NixOS Hetzner VPS template.

## Nix Flakes

The project is built around Nix Flakes, which provide a standardized, reproducible way to manage Nix expressions. The `flake.nix` file at the root of the repository defines the project's inputs (like `nixpkgs`), outputs (like NixOS configurations and developer shells), and other metadata.

## Module System

Our modules are standard NixOS modules, which are functions that take a set of inputs (like `config`, `lib`, and `pkgs`) and return an attribute set defining options and configuration.

### Module Structure

A typical module has the following structure:

```nix
{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = { /* ... */ };
  config = { /* ... */ };
}
```

- `options`: Defines the configuration options that the module exposes to the user.
- `config`: Defines the actual system configuration based on the values of the options.

## ZFS and LUKS

We use a combination of LUKS for full-disk encryption and ZFS for the filesystem. This provides both security and advanced storage features.

- **LUKS**: The root partition is encrypted with LUKS, and the key is required at boot time.
- **ZFS**: A ZFS pool is created on top of the encrypted LUKS device. We use ZFS for its features like snapshots, compression, and data integrity.

## Podman for Containers

For containerization, we use Podman in rootless mode. This provides a secure way to run containers without granting them root privileges on the host system.

## Further Reading

- [Architecture Overview](overview.md)
- [Security Model](security.md)
- [Performance Tuning](performance.md)
