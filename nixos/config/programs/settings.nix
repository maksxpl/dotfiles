{ config, pkgs, ... }:
{
  programs = {
    firefox.enable = true;
    thunar.enable = true;
    hyprland.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
      ohMyZsh = {
        enable = true;
#        plugins = [
#          "zsh-autosuggestions"
#          "zsh-autocomplete"
#        ];
      };
    };

    starship = {
      enable = true;
    };

  };

  services = {
    printing.enable = true; # enables CUPS whatever it is
    gnome.gnome-keyring.enable = true; # would be nice to be able to save passwords

    # X11 windowing 
    xserver.enable = true;
    # X11 keymaps?
    xserver.xkb = {
      layout = "pl";
      variant = "";
    };

    # KDE Env
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;
    };
  };

  networking = {
    networkmanager.enable = true;
  };

  hardware = {
    pulseaudio.enable = false; # enable pipewire
  };

}
