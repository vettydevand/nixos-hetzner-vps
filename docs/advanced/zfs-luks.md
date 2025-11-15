# ZFS and LUKS

This template uses a combination of LUKS for full-disk encryption and ZFS for the filesystem. This provides a powerful and secure storage solution.

## LUKS Encryption

LUKS (Linux Unified Key Setup) is the standard for disk encryption in Linux. We use it to encrypt the entire root partition. This means that all your data is encrypted at rest, and an attacker with physical access to your server will not be able to read your data without the encryption key.

The encryption key is required at boot time. You will need to enter it in the Hetzner Cloud console when your server boots.

## ZFS Filesystem

ZFS is an advanced filesystem with many features that are useful for servers:

- **Snapshots**: You can take atomic snapshots of your filesystem, which can be used for backups or to roll back changes.
- **Compression**: ZFS can compress your data on the fly, which can save a significant amount of disk space.
- **Data Integrity**: ZFS uses checksums to ensure the integrity of your data. If it detects a corrupt block, it will automatically try to repair it from a redundant copy (if you are using a mirrored or RAID-Z pool).
- **ARC (Adaptive Replacement Cache)**: ZFS has a sophisticated caching mechanism that can significantly improve read performance.

## Our Configuration

In this template, we create a single ZFS pool on top of the encrypted LUKS device. We then create several ZFS datasets within this pool:

- `rpool/root`: The root filesystem.
- `rpool/home`: The home directories.
- `rpool/nix`: The Nix store.

This allows us to manage these filesystems independently and apply different settings to each one.

## Further Reading

- [ZFS on Linux documentation](https://openzfs.github.io/openzfs-docs/)
- [LUKS documentation](https://gitlab.com/cryptsetup/cryptsetup/wikis/home)
