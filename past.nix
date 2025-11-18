{
  description = "A general purpose development shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages."${system}";
  in
  {
    devShells."${system}".default = pkgs.mkShell {
      packages = with pkgs; [
        gcc
        (pkgs.python3.withPackages(p: with p; [
          # Any python libraries can be imported here
          numpy
        ]))
      ];

      shellHook = ''
        zsh
      '';
    };
  };
}
