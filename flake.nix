{
  description = "osbm.dev astro website";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      package-json = builtins.fromJSON (builtins.readFile ./package.json);
    in
    {
      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs
          nodePackages.npm
        ];
        shellHook = ''
          export ASTRO_TELEMETRY_DISABLED=1
          echo Start developing the osbm.dev
        '';
      };
      packages."${system}".default = pkgs.buildNpmPackage rec {
        pname = package-json.name;
        version = package-json.version;
        src = ./.;

        buildInputs = with pkgs; [
          nodejs
          # npmHooks.npmConfigHook
        ];
        installPhase = ''
          runHook preInstall
          cp -pr --reflink=auto dist $out/
          runHook postInstall
        '';
        # npmDeps = pkgs.importNpmLock {
        #   npmRoot = ./.;
        # };
        # npmConfigHook = pkgs.importNpmLock.npmConfigHook;
        npmDepsHash = "sha256-Jvwu4F/ruaOqL+YDPoZ6XOZVOl3Ug+YFrK8VjuwD2W8=";

      };
    };
}
