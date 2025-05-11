{ config, pkgs, ... }: 

{

  home.packages = with pkgs; [
    # default 
    gst_all_1.gst-vaapi
    wget
    telegram-desktop
    transmission_4-gtk
    gamemode
    mangohud
    goverlay
    ffmpeg_6
    pass-wayland
    
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
    nerd-fonts.monofur
    nerd-fonts.intone-mono
    dejavu_fonts
    tlwg
    corefonts
    vistafonts
    inconsolata
    anonymousPro
    fira-code
    source-code-pro
    ];

  nixpkgs.config.allowUnfree = true; 
  fonts.fontconfig.enable = true;

}
