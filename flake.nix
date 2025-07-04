{
  description = "osbm.dev astro website";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {nixpkgs, ... }: let
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
  in {
    devShells = forAllSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      default = pkgs.mkShell {
        packages = with pkgs; [
        nodejs
        nodePackages.npm
      ];
      shellHook = ''
        export ASTRO_TELEMETRY_DISABLED=1
        echo Start developing the osbm.dev
      '';
    };});
    packages = forAllSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
      package-json = builtins.fromJSON (builtins.readFile ./package.json);
    in {
      default = pkgs.buildNpmPackage {
        pname = package-json.name;
        version = package-json.version;
        src = ./.;
        buildInputs = [pkgs.nodejs];
        installPhase = ''
          runHook preInstall
          cp -pr --reflink=auto dist $out/
          runHook postInstall
        '';
        npmDepsHash = "sha256-BdhGnDn08d59zVptU1nv3q1ChxZj6MkQY6yWLBW2iWk=";
      };
    });
  };
}
