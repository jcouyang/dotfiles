# UTF-8
set -x LANGUAGE en_US.UTF-8

set -x LANG en_US.UTF-8

set -x LC_ALL en_US.UTF-8

# Java
set -x JAVA_HOME $HOME/Applications/Graalvm
# emacs
set -x EDITOR emacsclient

set -gx PATH $HOME/.local/share/coursier/bin $JAVA_HOME/bin $HOME/.bloop $JAVA_HOME/jre/languages/js/bin $PATH

# rust
# set -x PATH $HOME/.cargo/bin $PATH
# github
alias git hub

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

test -e {$HOME}/.config/fish/credentials.fish; and source {$HOME}/.config/fish/credentials.fish

# backup abbrs
abbr -s | sort > ~/.config/fish/abbr.fish

# themes
set -g theme_display_virtualenv no

# AWS
set -x AWS_DEFAULT_REGION ap-southeast-2

# Nix
fenv source ~/.nix-profile/etc/profile.d/nix.sh
# fix nix bash warning
set -x LOCALE_ARCHIVE (nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive
