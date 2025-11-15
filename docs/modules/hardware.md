# Hardware Module

The `hardware.nix` module configures the system hardware.

## Features

- Enables CPU microcode updates.
- Configures the I/O scheduler.
- Sets the ZFS ARC size limit.
- Configures the system for a specific workload profile.

## Options

- `hardware.enableMicrocode`: Whether to enable CPU microcode updates. Defaults to `true`.
- `hardware.ioScheduler`: The I/O scheduler to use. Defaults to `mq-deadline` for NVMe and `bfq` for SATA.
- `hardware.zfsArcMax`: The maximum size of the ZFS ARC. Defaults to `1G`.
- `hardware.profile`: The workload profile to use. Can be one of `vps`, `database`, or `media`.

## Usage

This module is included by default in all profiles. You can customize its behavior by setting the options in your `flake.nix`.

```nix
{
  # ...
  hardware.zfsArcMax = "2G";
  hardware.profile = "database";
}
```
