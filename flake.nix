{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          env = {
            JAVA_HOME = "${pkgs.jdk17}/lib/openjdk";
          };

          packages = with pkgs; [
            flutter
            jdk17
            firebase-tools
          ];

          shellHook = ''
            export PATH="$PATH":"$HOME/.pub-cache/bin"

            flutter config --jdk-dir "${pkgs.jdk17}/lib/openjdk"
          '';
        };
      }
    );
}
