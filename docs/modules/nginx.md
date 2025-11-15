# Nginx

This module configures the Nginx web server.

## Options

- `mySystem.nginx.enable`: Whether to enable Nginx.
- `mySystem.nginx.serverName`: The server name for the default virtual host.

## Description

This module configures Nginx with a default virtual host. It also includes a self-signed SSL certificate for HTTPS.

To use a custom SSL certificate, you can specify the `sslCertificate` and `sslCertificateKey` options.

## Example

```nix
{
  imports = [ ./modules/nginx.nix ];

  mySystem.nginx = {
    enable = true;
    serverName = "your-hostname.com";
  };
}
```
