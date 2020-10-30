# UTF-8
set -x LANGUAGE en_US.UTF-8

set -x LANG en_US.UTF-8

set -x LC_ALL en_US.UTF-8

set -x SHELL fish
# Java
if test (uname) = "Darwin"
set -x JAVA_HOME (/usr/libexec/java_home)
else
set -x JAVA_HOME $HOME/Applications/Graalvm
end
# emacs
set -x EDITOR emacsclient
if test (uname) = "Darwin"
   set -gx PATH $HOME/Library/Application\ Support/Coursier/bin $PATH
else
   set -gx PATH $HOME/.local/share/coursier/bin $PATH
end

set -gx PATH $HOME/.nix-profile/bin $JAVA_HOME/bin $HOME/.bloop $JAVA_HOME/jre/languages/js/bin $PATH

alias git hub

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

test -e {$HOME}/.config/fish/credentials.fish; and source {$HOME}/.config/fish/credentials.fish

# backup abbrs
test -e ~/.config/fish/abbr.fish; or abbr -s | sort > ~/.config/fish/abbr.fish

# themes
# set -g theme_display_virtualenv no

# AWS
set -x AWS_DEFAULT_REGION ap-southeast-2

# Nix
fenv source ~/.nix-profile/etc/profile.d/nix.sh
# fix nix bash warning
if test (uname) != "Darwin"
set -x LOCALE_ARCHIVE (nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive
end