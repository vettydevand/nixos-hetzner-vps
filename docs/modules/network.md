# Network Module

The `network.nix` module configures the system's network.

## Features

- Configures the hostname.
- Enables networking.
- Configures the firewall.

## Options

- `networking.hostName`: The hostname of the server.
- `networking.firewall.enable`: Whether to enable the firewall. Defaults to `true`.
- `networking.firewall.allowedTCPPorts`: A list of TCP ports to allow through the firewall. Defaults to `[ 22 80 443 ]`.
- `networking.firewall.allowedUDPPorts`: A list of UDP ports to allow through the firewall. Defaults to `[]`.

## Usage

This module is included by default in all profiles. You can customize its behavior by setting the options in your `flake.nix`.

```nix
{
  # ...
  networking.hostName = "my-server";

  networking.firewall.allowedTCPPorts = [ 22 80 443 8080 ];
}
```
