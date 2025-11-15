# Automatic Upgrades

This module configures automatic system upgrades.

## Options

- `mySystem.automatic-upgrades.enable`: Whether to enable automatic upgrades.

## Description

This module configures the system to automatically upgrade all packages on a daily basis. It also sends an email notification when a new version of the system is available.

## Example

```nix
{
  imports = [ ./modules/automatic-upgrades.nix ];

  mySystem.automatic-upgrades.enable = true;
}
```
