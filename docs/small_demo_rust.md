# Rust Demo

@demo part@

```
which rustc
/nix/store/vqksgxrd1p091mnvz2bixnr8ylsyima1-rustc-1.52.1/bin/rustc
```

Not where you were expecting it to be from.

Everything that you install with nix is installed to /nix/store and just made available for you. So what happened when you did nix-shell -p rust is that rustc was installed to the nix store and made available via the $PATH variable for you.

Check what the $PATH variable contains inside the shell.

Let's make this thing a bit more declarative, plus it would be a pain if I had to type out that command if I had multiple dependencies. That is wheres shell.nix comes in