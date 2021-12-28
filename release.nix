let
  pkgs = import ./nix/pkgs {};

  haskellPackages = pkgs.haskellPackages.override {
    overrides = self: super: {
      monoidal-containers = super.callCabal2nix "monoidal-containers" (builtins.fetchGit {
        url = "git@github.com:bgamari/monoidal-containers.git";
        rev = "450acec61b2a7f75b6290e69fa7d88cb1e14854d";
      }) {};
    };
  };

in
haskellPackages.callPackage ./default.nix {}
