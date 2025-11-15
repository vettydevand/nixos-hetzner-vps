# ACME

This module configures ACME for automatic SSL certificate generation.

## Options

- `mySystem.acme.enable`: Whether to enable ACME.
- `mySystem.acme.email`: The email address to use for ACME registration.

## Description

This module configures ACME to automatically generate SSL certificates from Let's Encrypt. It uses the `nginx` module to solve the HTTP-01 challenge.

To use this module, you must have a registered domain name and your server must be accessible from the internet on port 80.

## Example

```nix
{
  imports = [
    ./modules/nginx.nix
    ./modules/acme.nix
  ];

  mySystem.nginx.enable = true;
  mySystem.nginx.serverName = "your-hostname.com";

  mySystem.acme = {
    enable = true;
    email = "your-email@example.com";
  };
}
```
