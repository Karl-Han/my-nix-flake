{pkgs, ...}@inputs: {
  extraConfig = builtins.readFile ../dotfiles/.tmux.conf;
  clock24 = true;
  keyMode = "vi";
  mouse = true;
  newSession = true;
  shell = "${pkgs.zsh}/bin/zsh";
  tmuxp.enable = true;

  prefix = "C-b";
  enable = true;
}