{pkgs,config,lib, ...}:
with lib;
let cfg = config.devtools;
in {
  options.devtools.enable = mkEnableOption "install devtools";
  config = mkIf cfg.enable {
    environment.shells = [ pkgs.bashInteractive pkgs.zsh ];
    environment.variables = {
      LANG = "en_US.UTF-8";
      EDITOR = "emacsclient";
      ALTERNATE_EDITOR = "vim";
      AWS_DEFAULT_REGION = "ap-southeast-2";
    };
    
    environment.shellAliases = {
      em = "emacsclient";
    };

    virtualisation = {
      docker.enable = false;
      podman = {
        enable = true;
        dockerCompat = true;
        dockerSocket.enable = true;
        defaultNetwork.dnsname.enable = true;
      };
    };


    programs.zsh = {
      enable = true;
      enableBashCompletion = true;
      autosuggestions.enable = true;
      ohMyZsh = {
        enable = true;
        plugins = [ "git" "z" "fzf" ];
        theme = "lambda";
      };
    };

    programs.git = {
      enable = true;
      config = {
        user = {
          name = "Jichao Ouyang";
          email = "oyanglulu@gmail.com";
          signingkey = "DA8B833B52604E63";
        };
        core.editor = "emacsclient";
        commit.gpgsign = true;
        github.user = "jcouyang";
        init.defaultBranch = "master";
        credential."https://github.com".helper = "${pkgs.gh}/bin/gh auth git-credential";
        credential."https://gist.github.com".helper = "${pkgs.gh}/bin/gh auth git-credential";
      };
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
      dhall
      dhall-json
      dhall-bash
      ## 1.1.1 has bug
      # dhall-lsp-server

      # Go
      go_1_18
      ## gopls has to build from go1.18
      # gopls

      # Rust
      cargo

      # python
      python39
    ];
  };
}
