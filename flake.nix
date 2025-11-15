{
  description = "A general purpose development shell";

  inputs = {
    nixpkgs.url = "github:nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devshells.${system}.default = pkgs.myShell {
      packages = with pkgs; [
        gcc
      ];

      shellHook = ''
        zsh
      '';
    };
  };
}
