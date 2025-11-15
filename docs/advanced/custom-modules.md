# Custom Modules

While this template provides a number of pre-built modules for common use cases, you will likely want to create your own custom modules to meet your specific needs.

## Creating a Custom Module

A custom module is just a Nix file that defines a set of options and configuration. Here is a simple example of a module that installs the `htop` package:

```nix
# modules/custom/htop.nix

{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.my-options.enable-htop = lib.mkEnableOption "Enable htop";

  config = lib.mkIf config.my-options.enable-htop {
    environment.systemPackages = [ pkgs.htop ];
  };
}
```

To use this module, you would import it into your `flake.nix` and enable it:

```nix
# flake.nix

{
  # ...
  nixosConfigurations.your-hostname = nixpkgs.lib.nixosSystem {
    # ...
    modules = [
      # ...
      ./modules/custom/htop.nix
      {
        my-options.enable-htop = true;
      }
    ];
  };
}
```

## Best Practices

- **Keep modules small and focused.** Each module should do one thing and do it well.
- **Use options to make your modules configurable.** Avoid hardcoding values.
- **Document your options.** Use the `description` attribute to explain what each option does.
- **Organize your modules into subdirectories.** This will help to keep your configuration organized as it grows.

## Further Reading

- [NixOS Manual: Chapter 8. Writing NixOS Modules](https://nixos.org/manual/nixos/stable/index.html#sec-writing-modules)
