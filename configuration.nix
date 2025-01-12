{ config, pkgs, inputs, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  environment.darwinConfig = "${builtins.getEnv "HOME"}/projects/nix/macos";
  nix.settings.experimental-features = "nix-command flakes";
  environment.shells = [
    pkgs.zsh
    pkgs.bash
  ];
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  environment.pathsToLink = [ "/share/zsh" ];
  programs.zsh = {
    enable = true;

    # Add custom directory to fpath
    shellInit = ''
      fpath+=("/opt/homebrew/share/zsh/site-functions")
    '';
  };
  # this part is managed by home-manager
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages =
  #   (import ./packages/system.nix { inherit pkgs; })
  #   ++ (import ./packages/user.nix { inherit pkgs; })
  #   ++ (import ./packages/dependency.nix { inherit pkgs; });
  # environment.systemPath =
  #   (import ./path/system.nix)
  #   ++ (import ./path/user.nix);

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

}
