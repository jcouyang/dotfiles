# Path to Oh My Fish install.
#set -gx OMF_PATH /Users/jcouyang/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/jcouyang/.config/omf

# UTF-8
set -x LANGUAGE en_US.UTF-8

set -x LANG en_US.UTF-8

set -x LC_ALL en_US.UTF-8

# Java
set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
# emacs
set EDITOR emacsclient
alias em emacsclient

# github
alias git hub

eval (thefuck --alias | tr '\n' ';')
set -x REA_LDAP_USER jouyang

# rbenv
set -gx RBENV_ROOT ~/.rbenv/

set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
