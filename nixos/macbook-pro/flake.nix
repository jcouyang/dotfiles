{
  description = "Jichao's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#D06QMM9GV2
    darwinConfigurations."D06QMM9GV2" = nix-darwin.lib.darwinSystem {
      modules = [ ./darwin-configuration.nix ];
    };
  };
}