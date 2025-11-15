# Development

This guide provides instructions for setting up a development environment to work on this template.

## Prerequisites

- [Nix](https://nixos.org/download.html)

## Development Environment

This repository includes a `flake.nix` file that defines a development environment with all the necessary tools. To enter the development environment, run:

```bash
nix develop
```

This will give you a shell with the following tools:

- `nixpkgs-fmt`: For formatting Nix code.
- `statix`: For linting Nix code.
- `deadnix`: for finding and removing unused Nix code.

## Building a Test VM

To test your changes, you can build a virtual machine with your configuration. First, edit `flake.nix` to set the hostname and other options for your test VM. Then, run:

```bash
nixos-rebuild build-vm --flake .#your-hostname
```

This will build the VM and create a script to run it. To start the VM, run:

```bash
./result/bin/run-your-hostname-vm
```

## Formatting and Linting

Before you commit your changes, please make sure to format and lint your code:

```bash
nix fmt
statix check
deadnix
```

This will help to ensure that the codebase is consistent and free of errors.
