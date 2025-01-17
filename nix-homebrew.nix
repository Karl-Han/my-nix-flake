{ homebrew-core, homebrew-cask, homebrew-bundle, ... }@inputs: {
  nix-homebrew = {
    # Install Homebrew under the default prefix
    enable = true;

    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
    enableRosetta = true;

    # User owning the Homebrew prefix
    user = "karl-han";

    # Automatically migrate existing Homebrew installations
    autoMigrate = true;
    taps = {
      "homebrew/homebrew-core"   = homebrew-core;
      "homebrew/homebrew-cask"   = homebrew-cask;
      "homebrew/homebrew-bundle"   = homebrew-bundle;
    };
    mutableTaps = true;
  };
}
