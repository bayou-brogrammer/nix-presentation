with (import <nixpkgs> {});

rec {
  yarn_app = mkYarnPackage {
    src = ./.;
    name = "03-yarn";
    yarnNix = ./yarn.nix;
    yarnLock = ./yarn.lock;
    packageJSON = ./package.json;
  };
}