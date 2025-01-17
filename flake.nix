{
  description = "my macOS nix flakes configuration";

  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
      nix-darwin.url = "github:LnL7/nix-darwin";
      nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
      home-manager.url = "github:nix-community/home-manager/release-24.11";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";

      # homebrew
      nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
      # Optional: Declarative tap management
      homebrew-core = {
        url = "github:homebrew/homebrew-core";
        flake = false;
      };
      homebrew-cask = {
        url = "github:homebrew/homebrew-cask";
        flake = false;
      };
      homebrew-bundle = {
        url = "github:homebrew/homebrew-bundle";
        flake = false;
      };

      # install homebrew packages without homebrew
      # but just use their code
      brew-nix = {
        url = "github:BatteredBunny/brew-nix";
        inputs.brew-api.follows = "brew-api";
      };
      brew-api = {
        url = "github:BatteredBunny/brew-api";
        flake = false;
      };
    };

  outputs =
    inputs@{ self
    , nixpkgs
    , nix-darwin
    , home-manager
    , brew-nix
    , nix-homebrew
    , homebrew-core
    , homebrew-cask
    , homebrew-bundle
    , ...
    }:
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Kunlins-MacBook-Pro
      # or just with the hostname
      # $ darwin-rebuild build --flake .
      darwinConfigurations."Kunlins-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        modules = [
          # nix-darwin
          ./hosts/macos/configuration.nix

          # home-manager
          home-manager.darwinModules.home-manager
          {
            nixpkgs.overlays = [ brew-nix.overlays.default ];
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            users.users."karl-han".home = "/Users/karl-han";
            home-manager.users."karl-han" = import ./home.nix;
            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }

          # homebrew
          nix-homebrew.darwinModules.nix-homebrew
          (import ./nix-homebrew.nix { inherit homebrew-core homebrew-cask homebrew-bundle; })
        ];
      };
      nixosConfigurations.lax = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/lax/configuration.nix
        ];
      };
    };
}
