# shell.nix

{ pkgs ? import <nixpkgs> { } }: 

pkgs.mkShell
{
  nativeBuildInputs = with pkgs; [
    gdb
    gcc
  ];
}
