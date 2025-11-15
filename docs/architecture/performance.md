# Performance Model

This template is optimized for performance in the Hetzner cloud environment. We have tuned various system parameters to ensure that your applications run as fast and efficiently as possible.

## Key Performance Optimizations

- **ZFS ARC Tuning**: The ZFS Adaptive Replacement Cache (ARC) is a memory-hungry component. We limit the ARC size to 1GB by default to prevent it from consuming all available RAM on a typical VPS.

- **I/O Scheduler**: We automatically select the best I/O scheduler based on the detected storage type (NVMe or SATA). This can significantly improve disk performance.

- **Kernel Parameters**: We set several kernel parameters to reduce latency and improve responsiveness, especially for web-facing workloads.

- **Workload Profiles**: The template includes several workload profiles (e.g., `vps`, `database`, `media`) that apply different tuning parameters based on the intended use case.

## Benchmarking

We have benchmarked this template extensively on various Hetzner VPS configurations. The results show significant improvements in boot time, memory usage, and I/O performance compared to a default NixOS installation.

See the `README.md` for a summary of our benchmark results.

## Customization

You can further customize the performance tuning by adjusting the options in the `hardware.nix` and `storage.nix` modules. For example, you can change the ZFS ARC size or select a different workload profile.

## Further Reading

- [Architecture Overview](overview.md)
- [Implementation Details](implementation.md)
- [Security Model](security.md)
