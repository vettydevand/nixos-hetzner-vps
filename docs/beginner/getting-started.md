# Getting Started

Welcome to the NixOS Hetzner VPS template! This guide will walk you through the process of deploying a new NixOS server on Hetzner Cloud in just a few minutes.

## Prerequisites

- A Hetzner Cloud account.
- A GitHub account.
- Basic familiarity with the command line.

## Step 1: Use the Template

Click the "Use this template" button on the [GitHub repository page](https://github.com/your-username/nixos-hetzner-vps) to create a new repository based on this template.

## Step 2: Configure Your Server

In your new repository, edit the `flake.nix` file to configure your server. You can choose a profile, set your hostname, and add your SSH public key.

## Step 3: Deploy

Run the interactive installation script from the Hetzner rescue system:

```bash
curl -L https://raw.githubusercontent.com/your-username/nixos-hetzner-vps/main/scripts/setup/interactive-config.sh | bash
```

The script will guide you through the installation process.

## Step 4: Reboot

Once the installation is complete, reboot your server. You will be able to log in with your SSH key.

Congratulations! You have successfully deployed a new NixOS server on Hetzner Cloud.

## Next Steps

- [Installation Guide](installation.md)
- [First Steps](first-steps.md)
