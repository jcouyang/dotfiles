{ config, pkgs, ... }:

rec {
  imports =
    [
      ../darwin.nix
    ];

  nixpkgs.hostPlatform = "aarch64-darwin";
}
