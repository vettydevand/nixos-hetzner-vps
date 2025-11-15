# LUKS

This module configures LUKS encryption.

## Options

- `mySystem.luks.enable`: Whether to enable LUKS encryption.

## Description

This module encrypts the root filesystem with LUKS. This protects your data at rest from unauthorized access, even if the physical storage is compromised.

When you enable this module, you will be prompted for a passphrase when the system boots. This passphrase is used to decrypt the root filesystem.

## Example

```nix
{
  imports = [ ./modules/luks.nix ];

  mySystem.luks.enable = true;
}
```
