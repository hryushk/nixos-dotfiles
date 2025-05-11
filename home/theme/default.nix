{ config, pkgs, ... }: 

{

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gtk2";
  };

  gtk = {
    enable = true;
    theme = {      
      name = "vimix-dark-grey";
      package = pkgs.vimix-gtk-themes.override {
        themeVariants = [ "grey" ];
        colorVariants = [ "dark" ];
        tweaks = [ "grey" ];
      };
    };

    iconTheme = {
      package = pkgs.flat-remix-icon-theme;
      name = "Flat-Remix-Black-Dark";
    };

    gtk3.extraConfig = {
      gtk-decoration-layout = "appmenu:none"; 
    };

    gtk4.extraConfig = {
      gtk-decoration-layout = "appmenu:none";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.apple-cursor;
    name = "macOS";
    size = 24;
  };

}
