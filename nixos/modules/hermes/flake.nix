{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hermes-agent.url = "github:NousResearch/hermes-agent";
  };

  outputs = { nixpkgs, hermes-agent, ... }: {
    nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        hermes-agent.nixosModules.default
        ../../thinkpad-x1/configuration.nix
      ];
    };
  };
}
