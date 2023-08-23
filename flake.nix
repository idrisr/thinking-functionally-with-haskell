{
  description = "my project description";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/23.05";

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      compiler = "ghc927";
      pkgs = import nixpkgs { system = system; };

      hPkgs = pkgs.haskell.packages."${compiler}";

      myDevTools = with hPkgs; [
        ghc # GHC compiler in the desired version (will be available on PATH)
        ghcid # Continuous terminal Haskell compile checker
        fourmolu # Haskell formatter
        hlint # Haskell codestyle checker
        hoogle # Lookup Haskell documentation
        haskell-language-server # LSP server for editor
        implicit-hie # auto generate LSP hie.yaml file from cabal
        retrie # Haskell refactoring tool
        cabal-install
        pkgs.zlib # External C library needed by some Haskell packages
        QuickCheck
        hspec
      ];
      app = pkgs.haskell.packages.${compiler}.callPackage ./test.nix;

    in {
      apps.${system}.default = {
        type = "app";
        program = "${app { }}/bin/main";
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = myDevTools;
        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath myDevTools;
      };

      packages.${system}.default = app { };
    };
}
