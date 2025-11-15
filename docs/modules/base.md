# Base Module

The `base.nix` module provides the core functionality of the system.

## Features

- Configures the Nix package manager.
- Sets the system timezone.
- Configures locales.
- Manages users and groups.

## Options

- `time.timeZone`: The system timezone. Defaults to `Europe/Berlin`.
- `i18n.defaultLocale`: The default locale. Defaults to `en_US.UTF-8`.
- `users.users.<name>`: Defines a user. See the [NixOS documentation](https://nixos.org/manual/nixos/stable/index.html#opt-users.users._name_) for more details.

## Usage

This module is included by default in all profiles. You can customize its behavior by setting the options in your `flake.nix`.

```nix
{
  # ...
  time.timeZone = "America/New_York";

  users.users.jane = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # For sudo access
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAA..." ];
  };
}
```
