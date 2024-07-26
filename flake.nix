{
  description = "Simple flake to dev on the B2B website";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ...}:
  let system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
      git
      node_20
      yarn
    ];

    shellHook = ''
      clear
      echo "Welcome to the flake :)"
    '';

  };
  };
}
