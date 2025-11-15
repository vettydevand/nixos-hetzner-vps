# Architecture Overview

This document provides a high-level overview of the NixOS Hetzner VPS template's architecture. Our design philosophy emphasizes modularity, security, and performance.

## Core Principles

- **Declarative Everything**: The entire system configuration, from the kernel to applications, is defined in Nix expressions.
- **Reproducibility**: Given the same configuration, the system will be identical, ensuring consistency across environments.
- **Modularity**: The system is composed of independent, reusable modules that can be mixed and matched.
- **Security by Default**: Secure configurations are enabled by default, and insecure options are explicitly opt-in.
- **Performance Optimized**: The template is tuned for the Hetzner cloud environment, providing optimal performance out of the box.

## System Layers

The architecture is divided into several layers, each with a specific responsibility:

```mermaid
graph TD
    A[Hardware (Hetzner VPS)] --> B(Storage Layer)
    B --> C{Base Layer}
    C --> D{Security Layer}
    C --> E{Service Layer}
    D --> F[Final System]
    E --> F
```

- **Hardware Layer**: The underlying Hetzner VPS infrastructure.
- **Storage Layer**: Manages the ZFS storage pool, datasets, and encryption (LUKS).
- **Base Layer**: Includes the NixOS kernel, bootloader, user management, and basic system utilities.
- **Security Layer**: Provides firewalling, SSH hardening, and other security-related configurations.
- **Service Layer**: Manages high-level services like web servers, databases, and monitoring.

## Modularity in Depth

Each module is a self-contained unit that exposes a set of options and provides a piece of the final system configuration. This allows for:

- **Easy Customization**: Users can enable, disable, or configure modules to fit their needs.
- **Independent Testing**: Each module can be tested in isolation.
- **Reusability**: Modules can be shared across different projects.

## Further Reading

- [Implementation Details](implementation.md)
- [Security Model](security.md)
- [Performance Tuning](performance.md)
