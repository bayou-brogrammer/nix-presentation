# Nix Shell

## What is nix-shell?

The nix-shell tool drops us in a shell after setting up the environment variables necessary to hack on a derivation. It does not build the derivation; it only serves as a preparation so that we can run the build steps manually.

> [!NOTE]  
> A derivation in Nix is a definition of a build, which takes some inputs and produces an output.

## How to use nix-shell?

Enter 01-shell dir and run `nix-shell`.

Bit of an explaination of what is happening here.

```nix
import nixpkgs
make_shell(packages=[nixpkgs.rustc])
```

One thing to note here is that we are importing nixpkgs. What happens here is that you are importing whatever nixpkgs version you have in your local system, but if you wanted to pin everything, you can just specify an exact version there and you will be able to trace back to everything that resulted in building the rustc that you use

## Components of a derivation
```nix
{

# Core Attributes
name:	string
pname?:	string
version?:	string
src:	path
 
# Building
buildInputs?:	list[derivation]
buildPhase?:	string
installPhase?:	string
builder?:	path
 
# Nix shell
shellHook?:	string
}
```