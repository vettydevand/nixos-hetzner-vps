# Security Module

The `security.nix` module configures various security settings.

## Features

- Enables LUKS encryption.
- Hardens the SSH server.
- Enables automatic security updates.

## Options

- `security.luks.enable`: Whether to enable LUKS encryption. Defaults to `true`.
- `security.ssh.enable`: Whether to harden the SSH server. Defaults to `true`.
- `security.autoUpdate.enable`: Whether to enable automatic security updates. Defaults to `true`.

## SSH Hardening

When `security.ssh.enable` is true, the following SSH settings are applied:

- `PermitRootLogin` is set to `no`.
- `PasswordAuthentication` is set to `no`.
- Only modern ciphers and key exchange algorithms are allowed.

## Automatic Updates

When `security.autoUpdate.enable` is true, the system will automatically download and install security updates every day. You can customize the schedule and other settings with the `security.autoUpdate` options.

## Usage

This module is included by default in all profiles. You can customize its behavior by setting the options in your `flake.nix`.

```nix
{
  # ...
  security.autoUpdate.enable = false; # Not recommended
}
```
