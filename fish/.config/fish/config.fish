# Path to Oh My Fish install.
set -gx OMF_PATH /Users/jcouyang/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/jcouyang/.config/omf

# UTF-8
set -x LANGUAGE en_US.UTF-8

set -x LANG en_US.UTF-8

set -x LC_ALL en_US.UTF-8

# emacs
set EDITOR emacsclient
alias em emacsclient

# github
alias git hub

function fuck
    eval (thefuck $history[1])
end

#z
set -x Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh

# rbenv
set -gx RBENV_ROOT ~/.rbenv/

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish
