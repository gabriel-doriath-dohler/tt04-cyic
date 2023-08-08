{
  description = "TinyTapeout 4 submission";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@attr:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell = pkgs.mkShell {
          nativeBuildInputs = [
            pkgs.gtkwave
            (pkgs.python311.withPackages (ps: with ps; [
              amaranth
              amaranth-boards
            ]))
          ];
        };
      }
    );
}
