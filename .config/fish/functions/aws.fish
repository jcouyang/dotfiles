complete -c aws -f -a "(begin; set -lx COMP_SHELL fish; set -lx COMP_LINE (commandline); $HOME/.nix-profile/bin/aws_completer; end)"
