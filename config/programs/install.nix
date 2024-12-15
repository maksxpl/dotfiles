{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
  # terminal
  zsh
  alacritty
  neovim
  starship

  # utils
  ## downloaders
  wget
  curl
  git
  nodejs

  ## monitoring
  btop # processes

  ## extra commands
  unzip
  psmisc # some commands like killall

  # sound
  pavucontrol
  alsa-utils

  # programs
  gparted
  vesktop
  teamspeak_client
  owncloud-client

  # desktop
  hyprland
  hyprpaper
  fuzzel
  waybar
  swaynotificationcenter

  # fonts
  hackgen-nf-font
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack"]; })
  ];

}

