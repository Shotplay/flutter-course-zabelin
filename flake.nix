{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        createPkgs =
          pkgs:
          import pkgs {
            inherit system;
            config = {
              allowUnfree = true;
            };
          };

        pkgs = createPkgs nixpkgs;
        pkgs-unstable = createPkgs nixpkgs-unstable;
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs-unstable; [
              flutter
          ];
        };
      }
    );
}
