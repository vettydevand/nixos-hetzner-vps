# Documentation

This document explains how to write and contribute to the documentation.

## Tools

The documentation is built using [MkDocs](https://www.mkdocs.org/) with the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme.

## Structure

The documentation is divided into several sections:

- **Beginner:** Guides for new users.
- **Architecture:** High-level overview of the architecture.
- **Modules:** Detailed documentation for each module.
- **Contributing:** Information for contributors.
- **About:** Information about the project.

## Style Guide

Please follow the [Google Developer Documentation Style Guide](https://developers.google.com/style).

## Building the Documentation

To build the documentation locally, you will need to have `mkdocs` and `mkdocs-material` installed.

```bash
nix-shell -p mkdocs mkdocs-material
mkdocs serve
```

This will start a local web server at `http://localhost:8000` where you can view the documentation.
