{pkgs ? import <nixpkgs> {} }:

let
  # https://discourse.nixos.org/t/how-to-override-an-emacs-package-src-url-to-fix-404/13947
  spinner-lzip = builtins.fetchurl {
    url = "https://elpa.gnu.org/packages/spinner-1.7.3.el.lz";
    sha256 = "188i2r7ixva78qd99ksyh3jagnijpvzzjvvx37n57x8nkp8jc4i4";
  };
  overrides = self: super: {
    spinner = super.spinner.override {
      elpaBuild = args: super.elpaBuild (args // {
          src = pkgs.runCommandLocal "spinner-1.7.3.el" {} ''
            ${pkgs.lzip}/bin/lzip -d -c ${spinner-lzip} > $out
          '';
        });
    };
  };
  emacsWithPackages = ((pkgs.emacsPackagesGen pkgs.emacs).overrideScope' overrides).emacsWithPackages;
  myEmacs = emacsWithPackages (epkgs: (with epkgs.melpaPackages; [
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
    indent-guide
    smartparens
    nix-mode
  ]));
in
myEmacs
