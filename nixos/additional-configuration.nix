{ config, pkgs, inputs, ... }:

{
  powerManagement.cpuFreqGovernor = "schedutil";

  # TLP service.
  powerManagement.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      RADEON_DPM_STATE_ON_AC = "battery";
      RADEON_DPM_STATE_ON_BAT = "battery";

      CPU_DRIVER_OPMODE_ON_AC = "active";
      CPU_DRIVER_OPMODE_ON_BAT = "active";

      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "power";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 99;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 60;

      CPU_SCALING_MIN_FREQ_ON_AC = 440000;
      CPU_SCALING_MAX_FREQ_ON_AC = 2400000;
      CPU_SCALING_MIN_FREQ_ON_BAT = 440000;
      CPU_SCALING_MAX_FREQ_ON_BAT = 2400000;

      CPU_BOOST_ON_AC = 0;
      CPU_BOOST_ON_BAT = 0;

      START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 81; # 80 and above it stops charging
    };
  };

  # Bluetooth.
  hardware.bluetooth = {
    enable = true; 
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  services.blueman.enable = true;
  fonts.fontDir.enable = true;
hardware.enableAllFirmware = true;
  # Pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
  services.pipewire.wireplumber.extraConfig."11-bluetooth-policy" = {
    "wireplumber.settings" = {
      "bluetooth.autoswitch-to-headset-profile" = false;
    };
  };
 
  # Flatpak.
  services.flatpak.enable = true;
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  #
  # Gnome polkit (requeires exec-once).
  systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # Enable gsettings
  environment.sessionVariables.XDG_DATA_DIRS = [ (pkgs.glib.getSchemaDataDirPath pkgs.gsettings-desktop-schemas) ];

  # Enable usb.
  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    devmon.enable = true;
  };

  # xdg.portal = {
  #   enable = true;
  #   configPackages = [ pkgs.xdg-desktop-portal-hyprland ];
  #   extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  # };
  
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  programs.hyprland = {
    enable = true;
# set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
# make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
}
