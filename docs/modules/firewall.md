# Firewall

This module configures the firewall.

## Options

- `mySystem.firewall.enable`: Whether to enable the firewall.
- `mySystem.firewall.allowedTCPPorts`: A list of allowed TCP ports.
- `mySystem.firewall.allowedUDPPorts`: A list of allowed UDP ports.

## Description

This module configures a restrictive firewall that blocks all incoming traffic by default. You can open specific ports by adding them to the `allowedTCPPorts` or `allowedUDPPorts` lists.

By default, the firewall allows traffic on ports 22 (SSH), 80 (HTTP), and 443 (HTTPS).

## Example

```nix
{
  imports = [ ./modules/firewall.nix ];

  mySystem.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443 8080 ];
  };
}
```
