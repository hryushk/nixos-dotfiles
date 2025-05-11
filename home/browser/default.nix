{ inputs, system, pkgs, ... }:

{

  home.packages = [
    inputs.zen-browser.packages."${system}".default
    pkgs.tor-browser
    pkgs.librewolf
    pkgs.firefox
  ];

}
