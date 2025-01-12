{ config, pkgs, ... }:
{
  home.username = "karl-han";
  home.packages =
    (import ./packages/system.nix { inherit pkgs; })
    ++ (import ./packages/user.nix { inherit pkgs; })
    ++ (import ./packages/dependency.nix { inherit pkgs; });
  programs.zsh = import ./packages/zsh.nix {inherit pkgs;};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
  home.homeDirectory = "/Users/karl-han";
}