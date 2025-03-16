{
  description = "osbm.dev astro website";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs
          nodePackages.npm
        ];
        shellHook = ''
          echo Start developing the osbm.dev
        '';
      };

    };
}
