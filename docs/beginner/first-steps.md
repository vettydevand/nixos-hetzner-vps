# First Steps

Now that you have your NixOS server up and running, here are a few things you can do to get started.

## Connecting to Your Server

You can connect to your server using SSH with the username and SSH key you configured during installation:

```bash
ssh your-username@your-server-ip
```

## Updating Your System

To update your system to the latest version of your configuration, run:

```bash
nixos-rebuild switch --flake .#your-hostname
```

If you want to update your Nix packages as well, use the `--upgrade` flag:

```bash
nixos-rebuild switch --flake .#your-hostname --upgrade
```

## Managing Services

NixOS uses `systemd` to manage services. You can use the `systemctl` command to start, stop, and check the status of services.

For example, to check the status of the `nginx` service:

```bash
systemctl status nginx
```

## Customizing Your Configuration

To customize your server, you can edit the `flake.nix` file and the files in the `modules` directory. After making changes, run `nixos-rebuild switch` to apply them.

## Next Steps

- [Advanced Topics](../advanced/declarative-management.md)
- [Module Reference](../modules/base.md)
- [Profile Reference](../profiles/vps.md)
