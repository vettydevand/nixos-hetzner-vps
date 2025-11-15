# Storage Module

The `storage.nix` module configures the system's storage.

## Features

- Creates a ZFS pool on top of a LUKS-encrypted device.
- Creates ZFS datasets for `/`, `/home`, and `/nix`.
- Enables ZFS compression and other features.

## Options

- `storage.device`: The block device to use for the installation. This is detected automatically by the installation script.
- `storage.zfs.compression`: The compression algorithm to use for ZFS. Defaults to `zstd`.
- `storage.zfs.autoSnapshot.enable`: Whether to enable automatic ZFS snapshots. Defaults to `true`.

## ZFS Snapshots

When `storage.zfs.autoSnapshot.enable` is true, the system will automatically take ZFS snapshots of your datasets. This allows you to easily roll back changes to your filesystem.

The snapshot schedule can be customized with the `storage.zfs.autoSnapshot` options.

## Usage

This module is included by default in all profiles. You can customize its behavior by setting the options in your `flake.nix`.

```nix
{
  # ...
  storage.zfs.compression = "lz4";
}
```
