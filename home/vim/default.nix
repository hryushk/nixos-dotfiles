{ inputs, config, pkgs, ... }:

{

  home.packages = with pkgs; [
    neovide
  ];

  programs.neovim = {
    enable = true;
    # plugins = with pkgs; [
    #   vimPlugins.clang_complete
    #
    # ];
  };

}

