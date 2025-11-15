# ZFS

This module configures the ZFS filesystem.

## Options

- `mySystem.zfs.enable`: Whether to enable ZFS.
- `mySystem.zfs.arc.max`: The maximum size of the ZFS ARC.

## Description

This module configures a ZFS storage pool with separate datasets for different parts of the system. It also includes a weekly scrub and daily snapshots.

By default, the ZFS ARC is limited to 1GB to prevent it from consuming all available memory. You can adjust this limit by setting the `mySystem.zfs.arc.max` option.

## Example

```nix
{
  imports = [ ./modules/zfs.nix ];

  mySystem.zfs = {
    enable = true;
    arc.max = "2G";
  };
}
```
