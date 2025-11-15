# Configuration

This guide explains how to configure your NixOS Hetzner VPS.

## `flake.nix`

The main configuration file for your server is `flake.nix`. This file defines the entire system configuration, including the hardware, storage, security, and services.

The `flake.nix` file is a Nix expression that returns an attribute set. The top-level attributes are:

- `description`: A short description of your system.
- `inputs`: The dependencies for your system, such as `nixpkgs` and `flake-utils`.
- `outputs`: A function that takes the `inputs` as arguments and returns the system configuration.

## Modules

The system configuration is built up from a set of modules. Each module is a self-contained unit of configuration that can be enabled, disabled, and configured.

You can see a list of available modules in the `modules` directory of the template repository.

To enable a module, simply import it into your `flake.nix` file. For example, to enable the `nginx` module:

```nix
imports = [
  ./modules/services/nginx.nix
];
```

To configure a module, you can set its options in your `flake.nix` file. For example, to set the `serverName` for Nginx:

```nix
services.nginx.serverName = "your-hostname.com";
```

For a complete list of configuration options, see the documentation for each module.

## Profiles

Profiles are pre-configured sets of modules for common use cases. For example, the `webserver` profile includes modules for Nginx, ACME (for SSL certificates), and monitoring.

You can use a profile as a starting point for your configuration and then customize it to your specific needs.
