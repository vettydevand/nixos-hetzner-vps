# Security Model

Security is a top priority in this template. We have implemented a multi-layered security model to protect your data and applications.

## Core Security Features

- **Full-Disk Encryption**: The entire root filesystem is encrypted using LUKS. This protects your data at rest from unauthorized access.

- **Firewall**: A restrictive firewall is enabled by default, only allowing traffic on essential ports (SSH, HTTP, HTTPS). All other ports are blocked.

- **SSH Hardening**: SSH access is hardened by disabling password authentication and root login. Only key-based authentication is allowed.

- **Rootless Containers**: We use Podman in rootless mode, which means that containers do not run with root privileges on the host. This limits the potential impact of a container compromise.

- **Regular Updates**: NixOS makes it easy to keep your system up-to-date with the latest security patches. A simple `nixos-rebuild switch --upgrade` will update all your packages.

## Security Modules

Our modular architecture allows you to enable or disable specific security features as needed. The security modules include:

- `luks.nix`: Manages LUKS encryption.
- `firewall.nix`: Configures the firewall.
- `ssh.nix`: Hardens the SSH server.

## Reporting Vulnerabilities

If you discover a security vulnerability, please report it to us privately. Do not open a public GitHub issue. See our `SECURITY.md` file for more details.

## Further Reading

- [Architecture Overview](overview.md)
- [Implementation Details](implementation.md)
- [Performance Tuning](performance.md)
