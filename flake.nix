{
  description = "osbm.dev astro website";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { nixpkgs, ...}:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      defaultPackage.x86_64-linux = pkgs.stdenv.mkDerivation {
        name = "osbm.dev";
        src = ./.;
        buildInputs = [ pkgs.nodejs ];
        installPhase = ''
          mkdir -p $out
          cp -r * $out
        '';
      };
    };

}