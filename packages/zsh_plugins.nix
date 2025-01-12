{ pkgs, ... }: [
  {
    name = "zsh-syntax-highlighting";
    src = pkgs.fetchFromGitHub {
      owner = "zsh-users";
      repo = "zsh-syntax-highlighting";
      rev = "0.8.0";
      sha256 = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
    };
  }
  {
    name = "zsh-cargo-completion";
    src = pkgs.fetchFromGitHub {
      owner = "MenkeTechnologies";
      repo = "zsh-cargo-completion";
      rev = "master";
      sha256 = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
    };
  }
]
