set -x TERM xterm-256color
# UTF-8
set -x LANGUAGE en_US.UTF-8

set -x LANG en_US.UTF-8

set -x LC_ALL en_US.UTF-8

set -x SHELL fish
set -x EDITOR emacsclient
set -x ALTERNATE_EDITOR nano

if test (uname) = "Darwin"
   set -gx PATH $HOME/Library/Application\ Support/Coursier/bin $PATH
else
   set -gx PATH $HOME/.local/share/coursier/bin $PATH
   set -x PATH /home/jcouyang/bin:$PATH
   set -x DOCKER_HOST unix:///run/user/1000/docker.sock
end

alias git hub

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

test -e {$HOME}/.config/fish/credentials.fish; and source {$HOME}/.config/fish/credentials.fish

# backup abbrs
test -e ~/.config/fish/abbr.fish; or abbr -s | sort > ~/.config/fish/abbr.fish

# AWS
set -x AWS_DEFAULT_REGION ap-southeast-2

# Nix
fenv source ~/.nix-profile/etc/profile.d/nix.sh
# fix nix bash warning
if test (uname) != "Darwin"
Set -x LOCALE_ARCHIVE (nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive
end
