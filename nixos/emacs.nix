{pkgs ? import <nixpkgs> {} }:

let
  myEmacs = pkgs.emacs; 
  emacsWithPackages = (pkgs.emacsPackagesGen myEmacs).emacsWithPackages; 
in
  emacsWithPackages (epkgs: (with epkgs.melpaPackages; [
    use-package
    ag
    ace-jump-mode
    company
    company-restclient
    haskell-mode
    helm
    json-mode
    key-chord
    lsp-haskell
    lsp-metals
    lsp-mode
    lsp-ui
    psc-ide
    nyan-mode
    langtool
    helm-projectile
    projectile
    helm-swoop
    flycheck
    dhall-mode
    markdown-mode
    rainbow-delimiters
    purescript-mode
    expand-region
    restclient
    textmate
    which-key
    yasnippet
    yasnippet-snippets
    unicode-fonts
    smartparens
    nix-mode
  ]))