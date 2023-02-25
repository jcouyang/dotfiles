{pkgs,config,lib, ...}:
with lib;
let cfg = config.devtools;
in {
  options.devtools.enable = mkEnableOption "install devtools";
  config = mkIf cfg.enable {
    environment.shells = [ pkgs.bashInteractive pkgs.zsh ];
    environment.variables = {
      EDITOR = "emacsclient";
      ALTERNATE_EDITOR = "vim";
      AWS_DEFAULT_REGION = "ap-southeast-2";
    };

    environment.shellAliases = {
      em = "emacsclient";
    };

    programs.zsh = if pkgs.stdenv.isLinux then {
      enable = true;
      enableBashCompletion = true;
      enableCompletion = true;
      interactiveShellInit = ''
      if [[ "$INSIDE_EMACS" = 'vterm' ]] \
          && [[ -n ''${EMACS_VTERM_PATH} ]] \
          && [[ -f ''${EMACS_VTERM_PATH}/etc/emacs-vterm-bash.sh ]]; then
          	source ''${EMACS_VTERM_PATH}/etc/emacs-vterm-bash.sh
      fi
      '';
      autosuggestions.highlightStyle = "fg=243,underline";
      autosuggestions.enable = true;
      ohMyZsh = {
        enable = true;
        plugins = [ "git" "z" "fzf" ];
        theme = "lambda";
      };
    } else {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
      enableFzfGit = true;
      enableFzfCompletion = true;
      enableFzfHistory = true;
      promptInit =
        ''
          SAVEHIST=200000
          HISTSIZE=200000
          plugins=(
            git
            z
            aws
          )
          source $HOME/.bashrc
          export ZSH_CACHE_DIR="$HOME/.cache/ohmyzsh"
          export ZSH_THEME=lambda

          source ${pkgs.oh-my-zsh}/share/oh-my-zsh/oh-my-zsh.sh
          source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh

          export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=246,bg=8,underline"
        '';
    };

    environment.systemPackages = with pkgs;[
      # General
      (callPackage ../../pkgs/emacs.nix {})
      silver-searcher
      fasd
      jq
      ispell
      graphviz
      stow
      awscli
      fzf
      coreutils
      direnv
      nix-direnv

      # Github
      gh
      git

      ## Scala
      # graalvm8-ce
      # (ammonite.override {jre = graalvm8-ce; })
      # (sbt.override { jre = graalvm8-ce; })

      # JS
      yarn

      # Haskell
      stack
      ghc
      stylish-haskell
      haskell-language-server

      # Dhall
      dhall
      dhall-json
      dhall-bash

      dhall-lsp-server

      # Go
      go
      ## gopls
      gopls

      # Rust
      cargo

      # python
      python39
    ];
  };
}
