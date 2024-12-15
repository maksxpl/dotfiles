{ config, pkgs, ... }:

{
  imports =
    [
      ./hosts/main/hardware-configuration.nix
      ./system.nix
      ./programs/install.nix
      ./programs/settings.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true; # Allow unfree packages

  networking.hostName = "nixos";

  console.keyMap = "pl2"; # Configure console keymap

  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users = { 
    defaultUserShell = pkgs.zsh;
    users.shiro = {
      isNormalUser = true;
      description = "Shiro";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.zsh;
    };
  };
}
