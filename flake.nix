{

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      packages.${system}.default = pkgs.tmuxPlugins.mkTmuxPlugin
        {
          pluginName = "picasso";
          version = "unstable-2024-03-01";
          src = builtins.fetchGit {
            url = "/workspace/tmux/tmux-picasso";
          };
          nativeBuildInputs = [ pkgs.makeWrapper ];
          postInstall = ''
            substituteInPlace $target/picasso.tmux \
              --replace  \$CURRENT_DIR $target
          '';
        };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          nixpkgs-fmt
          shellcheck
          shfmt
          watchexec
        ];
      };
    };
}
