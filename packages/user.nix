{pkgs, ... }: [
  pkgs.aria2

  # dev
  pkgs.rustup
  pkgs.poetry
  pkgs.sphinx

  pkgs.nixpkgs-fmt
  pkgs.zsh-autosuggestions
  pkgs.tmux
]