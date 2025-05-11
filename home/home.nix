{ config, pkgs, inputs, ... }:

{

  imports = [ 
    inputs.spicetify-nix.homeManagerModules.default
    inputs.nixcord.homeModules.nixcord
    ./nixcord 
    ./spicetify 
    ./browser 
    ./discord 
    ./ags 
    ./kitty 
    ./dunst 
    ./tofi 
    ./vim 
    ./theme
    ./pkgs 
    ./git
  ];  

  home.username = "hryu";
  home.homeDirectory = "/home/hryu";
  home.stateVersion = "24.11";

  home.file = {};

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  programs.home-manager.enable = true;

}
