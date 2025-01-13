{ config, pkgs, inputs, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  environment.darwinConfig = "${builtins.getEnv "HOME"}/projects/nix/macos";
  nix.settings.experimental-features = "nix-command flakes";
  environment.shells = [
    pkgs.zsh
    pkgs.bash
  ] ++ (import ../../packages/system.nix { inherit pkgs; });
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  environment.pathsToLink = [ "/share/zsh" ];
  programs.zsh = {
    enable = true;
  };
  # this part is managed by home-manager
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages = []
  # environment.systemPath = []

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

}
