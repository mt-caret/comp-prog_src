let
  pkgs = import (fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-19.03.tar.gz) {};
in
  pkgs.stdenv.mkDerivation {
    name = "nippo-builder";
    src = ./.;
    buildInputs = with pkgs; [
      pandoc
      nodePackages.serve
      entr
      optipng
      tmux
      xsel
    ];
    shellHook = ''
      make watch -j4
    '';
  }
