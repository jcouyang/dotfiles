{ config, pkgs, ... }:

rec {
  imports =
    [
      ../darwin.nix
    ];

  # s3 substituter removed: AWS SDK fork-pre-exec SIGSEGV in Nix 2.34.7 on macOS 26.x.
  # See ~/.hermes/skills/devops/nix-darwin-management/references/s3-substituter-fork-crash.md
  nixpkgs.hostPlatform = "aarch64-darwin";
}
