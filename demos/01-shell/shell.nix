with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    rustc
  ];

  shellHook = ''
    alias ll="ls -l"
    export FOO=bar
  '';
}