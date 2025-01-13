{ ... }@inputs: {
  enable = true;
  enableCompletion = true;
  autosuggestion = {
    enable = true;
  };
  envExtra = ''
    . "$HOME/.cargo/env"
    export LANG=en_US.UTF-8
  '';

  oh-my-zsh = {
    enable = true;
    theme = "amuse";
    plugins = [
      "git"
      "vi-mode"
      "z"
      "extract"
      "colored-man-pages"
      "history-substring-search"
      "rust"
      "web-search"
      "docker"
      "docker-compose"
      "pip"
      "kubectl"
    ];
  };
  plugins = import ./zsh_plugins.nix {pkgs = inputs.pkgs;};
  # Add custom directory to fpath
  initExtraBeforeCompInit = ''
    fpath+=("/opt/homebrew/share/zsh/site-functions")
    # for zsh-completions homebrew package
    fpath+=("/opt/homebrew/share/zsh-completions")
  '';
  initExtra = builtins.readFile ../dotfiles/shell_globals.sh;
}
