# Backups

This module configures automatic backups to a remote server.

## Options

- `mySystem.backups.enable`: Whether to enable automatic backups.
- `mySystem.backups.host`: The hostname of the backup server.
- `mySystem.backups.user`: The username for the backup server.
- `mySystem.backups.password`: The password for the backup server.

## Description

This module configures automatic daily backups to a remote server using `rsync`. It backs up the entire `/` directory, excluding temporary files and directories.

## Example

```nix
{
  imports = [ ./modules/backups.nix ];

  mySystem.backups = {
    enable = true;
    host = "your-backup-server.com";
    user = "backup-user";
    password = "your-password";
  };
}
```
