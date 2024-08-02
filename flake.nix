{
  description = "Simple flake to dev on the B2B website";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... }:
  let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    hugoVersion = "0.124.3"; # Specify your desired version here
    hugo = if builtins.compareVersions hugoVersion "0.125.0" == -1 
           then pkgs.hugo.overrideAttrs (oldAttrs: rec {
             version = "0.125.0"; # the latest version
             src = pkgs.fetchFromGitHub {
               owner = "gohugoio";
               repo = "hugo";
               rev = "v${version}";
               sha256 = "0mzl03g70bmkyz3l3whp9p1yxmvx0kr9r8g1i4w4v0p0kw9b9k5a"; # update this with the correct sha256
             };
           })
           else pkgs.hugo.overrideAttrs (oldAttrs: rec {
             version = hugoVersion;
             src = pkgs.fetchFromGitHub {
               owner = "gohugoio";
               repo = "hugo";
               rev = "v${version}";
               sha256 = "0mzl03g70bmkyz3l3whp9p1yxmvx0kr9r8g1i4w4v0p0kw9b9k5a"; # update this with the correct sha256
             };
           });

  in
  {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        git
        nodejs_20
        yarn
        hugo
      ];

      shellHook = ''
        clear
        echo "Welcome to the flake :)"
        yarn install
      '';
    };
  };
}

