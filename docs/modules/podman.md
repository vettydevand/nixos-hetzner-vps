# Podman Module

The `podman.nix` module configures Podman for rootless containers.

## Features

- Enables Podman.
- Configures the default network.
- Enables the Podman socket for Docker compatibility.

## Options

- `virtualisation.podman.enable`: Whether to enable Podman. Defaults to `true`.
- `virtualisation.podman.defaultNetwork.settings.dns_enabled`: Whether to enable DNS for the default network. Defaults to `true`.
- `services.podman.socket.enable`: Whether to enable the Podman socket. Defaults to `true`.

## Usage

This module is included in the `vps` profile. You can customize its behavior by setting the options in your `flake.nix`.

```nix
{
  # ...
  # No specific options to set here, but you can override the defaults if needed.
}
```

## Using Podman with Docker Compose

Because we enable the Podman socket, you can use `docker-compose` to manage your Podman containers. Just make sure that your `DOCKER_HOST` environment variable is set to the path of the Podman socket:

```bash
export DOCKER_HOST=unix:///run/user/$(id -u)/podman/podman.sock
```
