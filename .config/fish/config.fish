# UTF-8
set -x LANGUAGE en_US.UTF-8

set -x LANG en_US.UTF-8

set -x LC_ALL en_US.UTF-8

# Java
set -x JAVA_HOME /Applications/Graalvm/Contents/Home
# emacs
set -x EDITOR emacsclient

set -gx PATH $PATH /Applications/Graalvm/Contents/Home/bin /Applications/Graalvm/Contents/Home/jre/languages/js/bin/ /usr/local/texlive/2018/bin

# rust
set -x PATH $HOME/.cargo/bin $PATH
# github
alias git hub

eval (thefuck --alias | tr '\n' ';')

set -x REA_LDAP_USER jouyang

# rbenv
status --is-interactive; and source (rbenv init -|psub)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# test -e {$HOME}/.config/fish/credentials.fish; and source {$HOME}/.config/fish/credentials.fish

# backup abbrs
abbr -s | sort > ~/.config/fish/abbr.fish

# themes
set -g theme_display_virtualenv no

# OPAM configuration
. /Users/jichao.ouyang/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

# AWS
set -x AWS_DEFAULT_REGION ap-southeast-2
