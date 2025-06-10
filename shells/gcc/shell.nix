# shell.nix

{ pkgs ? import <nixpkgs> { } }: 

pkgs.mkShell
{
  nativeBuildInputs = with pkgs; [
    libgcc 
    gcc
    gdb
  ];
}
