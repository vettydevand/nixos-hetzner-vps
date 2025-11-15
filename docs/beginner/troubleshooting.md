# Troubleshooting

This guide provides solutions to common problems you might encounter.

## Installation Issues

### `curl: (22) The requested URL returned error: 404`

This error means that the installation script could not be downloaded. Make sure that you have entered the correct URL and that your repository is public.

### `unsupported filesystem`

This error indicates that the installation script was unable to create the ZFS filesystem. This can happen if the server does not have enough RAM. We recommend at least 2GB of RAM for ZFS.

## Boot Issues

### Server does not boot after installation

If your server does not boot after the installation, it is likely that there is an issue with the bootloader configuration. You can try to boot into the rescue system again and inspect the logs in `/mnt/var/log`.

## Network Issues

### No network connection after boot

If you do not have a network connection after booting into NixOS, it is likely that there is an issue with the network configuration. Double-check your network settings in `flake.nix`.

## Getting Help

If you are still having trouble, please reach out to our community for help.

- [GitHub Discussions](https://github.com/your-username/nixos-hetzner-vps/discussions)
- [Discord](https://discord.gg/your-invite)
