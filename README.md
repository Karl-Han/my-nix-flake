# Nix Deployment

This is a project to provide unified interface (through Nix) on
all my devices.

## Branch Management

There are two kinds of branches:

- general configuration: modification made to all except home.nix
- profile-specific configuration: bind to a specific host and a
    a specific profile

In this way, we can always have consistent generation configuration
for environment, while we can easily rebase the profile-specific.

## Folder Structure

Nix-specific Folders:

- `flake.nix` and its lock: centralized configurations
- `home.nix`: default home-manager profile (for reference)
    - different hosts should have their branch
- `apps/`: application specific configurations
- `hosts/`: host-specific configurations

General Folders:

- `bin/`: executables
- `docs/`: docs with applications that are used in the Nix environment
- `examples/`: runnable examples
- `gitignores`: handy gitignores for common projects
- `requirements.txt`: Python dependencies for sphinx

## Tech Stack

- Nix
    - Flakes
    - Home-Manager
    - Homebrew-Nix
    - Brew-Nix
- Sphinx