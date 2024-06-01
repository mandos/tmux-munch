{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        devPackages = [
          (pkgs.bats.withLibraries (p: [ p.bats-support p.bats-assert ]))
          pkgs.watchexec
        ];
        plugin = pkgs.tmuxPlugins.mkTmuxPlugin {
          pluginName = "munch";
          version = "unstable";
          src = self;
          postInstall = ''
            ls -al $target && \
              substituteInPlace $target/munch.tmux \
                --replace  \$CURRENT_DIR $target
          '';
        };
      in
      {
        packages.default = plugin;

        packages.dev = (pkgs.symlinkJoin
          {
            name = "dev-environment";
            paths = [
              plugin
              plugin.buildInputs
              pkgs.tmux
              pkgs.bashInteractive
              pkgs.busybox
            ] ++ devPackages;
          });

        devShell = pkgs.mkShell {
          buildInputs = devPackages;
        };
      }
    );
}
