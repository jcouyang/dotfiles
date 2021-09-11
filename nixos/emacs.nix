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
  theEmacs = if pkgs.stdenv.isDarwin then pkgs.emacsMacport else pkgs.emacs;
  emacsWithPackages = ((pkgs.emacsPackagesGen theEmacs).overrideScope' overrides).emacsWithPackages;
  myEmacs = emacsWithPackages (epkgs: (with epkgs.melpaPackages; [
    ace-jump-mode
    ag
    company
    company-restclient
    dhall-mode
    expand-region
    flycheck
    haskell-mode
    helm
    helm-projectile
    helm-swoop
    indent-guide
    json-mode
    key-chord
    langtool
    lsp-haskell
    lsp-metals
    lsp-mode
    lsp-ui
    markdown-mode
    nix-mode
    nyan-mode
    ob-restclient
    projectile
    psc-ide
    purescript-mode
    rainbow-delimiters
    restclient
    smartparens
    textmate
    unicode-fonts
    use-package
    which-key
    yasnippet
    yasnippet-snippets
  ]));
in
myEmacs
