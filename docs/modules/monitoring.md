# Monitoring

This module configures the monitoring stack.

## Options

- `mySystem.monitoring.enable`: Whether to enable the monitoring stack.

## Description

This module configures a monitoring stack based on Prometheus and Grafana. It also includes a node exporter to collect system metrics.

When you enable this module, a Grafana instance will be available at `http://<your-hostname>:3000`. The default username and password are `admin` and `admin`.

## Example

```nix
{
  imports = [ ./modules/monitoring.nix ];

  mySystem.monitoring.enable = true;
}
```
