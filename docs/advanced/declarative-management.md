# Declarative System Management

One of the core concepts of NixOS is declarative system management. This means that you define the entire state of your system in a set of configuration files, and NixOS takes care of making the system match that configuration.

## The NixOS Configuration

The main configuration file is `flake.nix`. This file, along with the modules it imports, defines everything about your system:

- The packages that are installed.
- The services that are running.
- The users and groups.
- The firewall rules.
- And much more.

## Atomic Upgrades and Rollbacks

When you change your configuration and run `nixos-rebuild switch`, NixOS builds a new version of your system in the background. If the build is successful, it makes the new version the default and switches to it. This process is atomic, meaning that it either completes successfully or has no effect.

If something goes wrong with the new version, you can easily roll back to the previous one by running:

```bash
nixos-rebuild switch --rollback
```

This makes system administration much safer and more reliable.

## Reproducibility

Because the entire system is defined in code, you can easily reproduce it on another machine. This is great for testing, staging, and production environments. You can be confident that your development environment is exactly the same as your production environment.

## Further Reading

- [NixOS Manual: Chapter 2. Configuration Syntax](https://nixos.org/manual/nixos/stable/index.html#sec-configuration-syntax)
- [NixOS Pills: From a Package to a System](https://nixos.org/guides/nix-pills/from-a-package-to-a-system.html)
