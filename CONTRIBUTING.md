# Contributing to NixOS Hetzner VPS Template

Thank you for your interest in contributing to this project! We welcome contributions from everyone, regardless of experience level.

## 🤝 How to Contribute

### 1. Reporting Issues
- Check existing issues first to avoid duplicates
- Use the [bug report template](.github/ISSUE_TEMPLATE/bug_report.md) for bugs
- Use the [feature request template](.github/ISSUE_TEMPLATE/feature_request.md) for new features
- Include detailed reproduction steps for bugs

### 2. Pull Requests
1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Make your changes and commit them with descriptive messages
4. Push to your fork: `git push origin feature/your-feature-name`
5. Create a Pull Request

### 3. Development Workflow

#### Setup
```bash
git clone https://github.com/your-username/nixos-hetzner-vps
cd nixos-hetzner-vps
```

#### Testing Changes
Before submitting PRs, please test your changes:

```bash
# Test Nix syntax
nix flake check

# Test shell scripts
shellcheck scripts/*.sh

# Test in VM (requires KVM)
nix run .#test-vm
```

### 4. Code Style Guidelines

#### Nix Code
- Use 2-space indentation
- Keep lines under 100 characters
- Use descriptive variable names
- Document complex functions
- Follow Nixpkgs style guide

#### Shell Scripts
- Use `set -euo pipefail` at the top
- Add error handling with `trap`
- Use functions for reusable code
- Add comments for complex logic
- Validate inputs and dependencies

#### Documentation
- Write in clear, concise English
- Use Markdown formatting consistently
- Include code examples where relevant
- Keep documentation up-to-date with code changes

### 5. Pull Request Requirements
- All tests must pass
- Documentation must be updated for new features
- CHANGELOG.md must be updated
- No merge conflicts with main branch
- Code review from at least one maintainer

## 🚀 Release Process
- Releases are tagged with semantic versioning (vX.Y.Z)
- CHANGELOG.md is updated with each release
- GitHub Releases are created with detailed notes
- Docker images are built and pushed to GHCR

## 🤔 Questions?
If you have questions about contributing:
- Open a GitHub Discussion
- Join our Discord/Matrix channel (link in README)
- Comment on relevant issues

## 🙏 Thank You!
Your contributions help make this project better for everyone. We appreciate your time and effort!

---
This document follows the [Contributor Covenant](https://www.contributor-covenant.org/) code of conduct.
