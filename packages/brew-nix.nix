{ pkgs, ... }:
let
  bc = pkgs.brewCasks;
in
[
  bc.marta
  # bc."zsh-completions"
]
