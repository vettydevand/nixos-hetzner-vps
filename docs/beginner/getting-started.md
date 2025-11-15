# Getting Started with Your NixOS Hetzner VPS

Welcome to your new production-ready NixOS environment on Hetzner! This guide will walk you through the first steps to get your server up and running.

## 1. Understanding Your Environment

Your server is configured with:
- **NixOS**: A declarative Linux distribution that makes your system reproducible and reliable.
- **ZFS**: A modern filesystem that provides data integrity and advanced features like snapshots.
- **LUKS**: Full-disk encryption to protect your data at rest.
- **Podman**: A rootless container engine for running applications in isolation.

## 2. Choosing Your Installation Method

We offer three main installation methods, each with its own advantages:

### Interactive Installation (Recommended)

Perfect for beginners, our interactive wizard guides you through the configuration process step-by-step.

```bash
# Run this in the Hetzner rescue system
curl -L https://raw.githubusercontent.com/your-username/nixos-hetzner-vps/main/scripts/setup/interactive-config.sh | bash
```

**Pros**:
- No prior Nix knowledge required
- Guided setup with explanations
- Error prevention with built-in validation

**Cons**:
- Less flexible than manual methods

### Quick Installation (Advanced)

For users who are comfortable with the command line and want a faster setup.

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/nixos-hetzner-vps
    cd nixos-hetzner-vps
    ```

2.  **Choose a profile**:
    Copy one of the templates from the `templates/by-profile` directory to `flake.nix` and customize it.
    ```bash
    cp templates/by-profile/webserver.template.nix flake.nix
    # Edit flake.nix with your settings
    ```

3.  **Run the installer**:
    ```bash
    bash scripts/setup/quick-install.sh
    ```

**Pros**:
- Fast and automated
- Customizable through template files

**Cons**:
- Requires familiarity with Nix syntax

### Manual Installation (Expert)

For full control over the installation process, you can follow our detailed manual installation guide.

➡️ **[Full Installation Guide](installation.md)**

**Pros**:
- Complete control over every setting
- Ideal for complex or non-standard setups

**Cons**:
- Requires deep knowledge of NixOS and ZFS
- Higher risk of configuration errors

## 3. First Login and System Check

After the installation is complete and your server has rebooted, you can log in with the SSH key you provided.

```bash
ssh admin@YOUR_SERVER_IP
```

### Verify System Health

1.  **Check ZFS pool status**:
    ```bash
    zpool status
    ```
    The pool should be `ONLINE` and all devices should be healthy.

2.  **Check system services**:
    ```bash
    systemctl --failed
    ```
    This command should show no failed services.

3.  **Check memory usage**:
    ```bash
    free -h
    ```
    ZFS ARC should be using around 1GB of memory, as configured for VPS environments.

## 4. Next Steps

Now that your server is running, here are a few things you can do:

-   **Deploy a container**: Use Podman to run your first application.
    ```bash
    podman run -d -p 8080:80 docker.io/library/nginx
    ```

-   **Customize your configuration**: Edit your `flake.nix` and run `nixos-rebuild switch` to apply changes.

-   **Explore the documentation**: Dive deeper into the architecture, modules, and advanced features of your NixOS system.
    -   **[Architecture Overview](../architecture/overview.md)**
    -   **[Modules Reference](../modules/base.md)**

-   **Set up monitoring**: Configure Prometheus and Grafana to monitor your server's performance.
    -   **[Monitoring Guide](../modules/monitoring.md)**

## 5. Getting Help

If you run into any issues, our community is here to help:

-   **[GitHub Discussions](https://github.com/your-username/nixos-hetzner-vps/discussions)**: For questions and feature requests.
-   **[Discord Server](https://discord.gg/your-invite)**: For real-time chat and support.

Welcome to the world of reproducible infrastructure with NixOS! We're excited to see what you build.
