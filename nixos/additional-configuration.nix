{ config, pkgs, ... }:

{
  boot = {
    kernelModules = [ "amd-pstate" ];
    kernelParams = [ "amd_pstate=guided" ];
  };
  powerManagement.cpuFreqGovernor = "ondemand";

  # TLP service.
  powerManagement.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      # CPU_DRIVER_OPMODE_ON_AC = "guided";
      # CPU_DRIVER_OPMODE_ON_BAT = "guided";
      #
      # CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
      # CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";
      #
      # PLATFORM_PROFILE_ON_AC = "balanced";
      # PLATFORM_PROFILE_ON_BAT = "low-power";
      #
      # CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      # CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      CPU_SCALING_MIN_FREQ_ON_AC = 0;
      CPU_SCALING_MAX_FREQ_ON_AC = 3300000;
      CPU_SCALING_MIN_FREQ_ON_BAT = 0;
      CPU_SCALING_MAX_FREQ_ON_BAT = 3300000;

      CPU_BOOST_ON_AC = 0;
      CPU_BOOST_ON_BAT = 0;

      START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
    };
  };

  # Bluetooth.
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Pipewire.
  services.pulseaudio.enable = false;
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

  xdg.portal = {
    enable = true;
    configPackages = [ pkgs.xdg-desktop-portal-hyprland ];
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
  
  programs.hyprland.enable = true;
}
