{ config, pkgs, ... }:
let nixos = pkgs.callPackage ../common.nix { };
in {
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    nixos.environment.systemPackages ++ [
      pkgs.oh-my-zsh
      pkgs.zsh-autosuggestions
    ];

  environment.variables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
    LANG = "en_US.UTF-8";
    EDITOR = "emacsclient";
    ALTERNATE_EDITOR = "vim";
    AWS_DEFAULT_REGION = "ap-southeast-2";
  };
  
  environment.shellAliases = {
    dc = "docker compose";
    em = "emacsclient";
  };
  
  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh = {
    enable = true;  # default shell on catalina
    enableCompletion = true;
    enableBashCompletion = true;
    enableFzfGit = true;
    enableFzfCompletion = true;
    enableFzfHistory = true;
    variables = {
      ZSH_THEME="lambda";
      ZSH_CACHE_DIR="$HOME/.cache/ohmyzsh";
    };
    promptInit = ''
      plugins=(
          git
          z
          aws
      )
      source ${pkgs.oh-my-zsh}/share/oh-my-zsh/oh-my-zsh.sh
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    '';
  };
  # programs.fish.enable = true;
  services.nix-daemon.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
  system.defaults.trackpad.TrackpadThreeFingerDrag = true;
}
