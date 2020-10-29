# Wrap git automatically by adding the following to ~/.config/fish/functions/git.fish:

function git --wraps hub --description 'Alias for hub, which wraps git to provide extra functionality with GitHub.'
    hub $argv
end
