{ pkgs, ...}:

{

# programs.firefox.package = (pkgs.wrapFirefox.override { libpulseaudio = pkgs.apulse; }) pkgs.firefox-unwrapped { };
programs.firefox.enable = true;

}
