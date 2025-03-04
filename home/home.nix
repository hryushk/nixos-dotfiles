{ config, pkgs, inputs, ... }:

{

  imports = [ ./firefox  ./discord ./kitty ./dunst ./tofi ./vim ];  

  home.username = "hryu";
  home.homeDirectory = "/home/hryu";

  home.stateVersion = "24.11";
  nixpkgs.config.allowUnfree = true; 

  programs.git = { 
    enable = true;
    userName  = "hryushk"; 
    userEmail = "wcaofow@tuta.io"; 
  };
  
  home.packages = with pkgs; [

    # default 
    gst_all_1.gst-vaapi
    wget
    telegram-desktop
    tor-browser
    transmission_4-gtk
    gamemode
    mangohud
    goverlay
    firefox
    ffmpeg_6
    
    # hypr 
    hypridle
    hyprpaper
    waybar
    hyprlock
    hyprcursor
    brightnessctl
    hyprshot
    hyprpicker

    # Gnome packages.
    nautilus
    evince
    eog
    file-roller
    simple-scan
    gnome-text-editor
    gnome-disk-utility
    gnome-system-monitor
    gnome-calculator
    gnome-calendar
    totem
    polkit_gnome
    gnome-keyring

    # Work.
    github-desktop
    libreoffice
    gimp

    # Utils.
    libsecret
    brightnessctl
    pavucontrol
    # wireplumber
    glib
    xorg.xwininfo
    openssl
    ventoy-full
    wl-clipboard
    lm_sensors
    libinput

    # OBS-Studio
    obs-studio
    obs-studio-plugins.obs-vaapi
    libva 
    
    # fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    dejavu_fonts
    tlwg
    corefonts
    vistafonts
  ];

  fonts.fontconfig.enable = true;

  home.file = {};

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

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

  programs.home-manager.enable = true;

}
