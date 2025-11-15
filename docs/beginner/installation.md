# Installation Guide

This guide provides detailed instructions for installing NixOS on a Hetzner VPS using this template.

## Step 1: Create a Hetzner Cloud Server

1. Log in to your Hetzner Cloud account.
2. Create a new server. Choose a location, server type, and image. For the image, select `Debian 11` or `Ubuntu 22.04`. We will overwrite this image with NixOS.

## Step 2: Boot into the Rescue System

1. Go to your server's `Rescue` tab.
2. Select `linux64` as the rescue image and click `Enable Rescue System`.
3. Reboot your server.

## Step 3: Run the Installation Script

Log in to the rescue system via SSH. The root password will be displayed in the Hetzner Cloud console.

Now, run the interactive installation script:

```bash
curl -L https://raw.githubusercontent.com/your-username/nixos-hetzner-vps/main/scripts/setup/interactive-config.sh | bash
```

The script will ask you for your configuration details, such as your hostname, username, and SSH key.

## Step 4: Reboot

Once the script is finished, reboot your server:

```bash
reboot
```

Your server will now boot into your new NixOS installation. You can log in with your configured username and SSH key.

## Troubleshooting

If you encounter any issues during the installation, please see our [Troubleshooting](troubleshooting.md) guide or ask for help in our [community channels](../contributing/community.md).
