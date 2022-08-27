let pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/42948b300670.tar.gz" ) {};
in pkgs.go_1_18
