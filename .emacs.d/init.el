
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)
(require 'org)
(setq org-confirm-babel-evaluate nil
      vc-follow-symlinks nil)

(org-babel-load-file "~/.emacs.d/README.org")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8891c81848a6cf203c7ac816436ea1a859c34038c39e3cf9f48292d8b1c86528" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" default)))
 '(package-selected-packages
   (quote
    (vue-mode presentation doom-themes company-box yaml-mode web-mode visual-regexp use-package unicode-fonts tide textmate sublimity smex smartparens smart-mode-line slime sequential-command scss-mode rubocop robe request-deferred reason-mode rbenv rainbow-mode purescript-mode prodigy popwin pallet ox-tufte ox-pandoc ox-gfm ox-asciidoc org-present org-plus-contrib on-screen nyan-mode multiple-cursors moz merlin markdown-mode magit lua-mode langtool key-chord json-mode js2-mode intero indent-guide iedit idle-highlight-mode htmlize howdoi highlight-symbol highlight-indentation helm-swoop helm-projectile helm-ls-git helm-git-grep helm-ag graphviz-dot-mode git-link gist geiser flx-ido fish-mode feature-mode fasd expand-region epresent ensime editorconfig edit-indirect drag-stuff dracula-theme discover-my-major dired+ diminish diff-hl deft company-tern company-emoji color-theme-solarized color-theme-sanityinc-tomorrow coffee-mode cider buffer-move back-button ag adoc-mode ace-jump-mode))))
