{ ... }:

{
  system.stateVersion = "24.05";

  boot.loader = {
  efi = {
    canTouchEfiVariables = true;
    # assuming /boot is the mount point of the  EFI partition in NixOS (as the installation section recommends).
    efiSysMountPoint = "/boot";
  };

  grub = {
    devices = [ "nodev" ];
    efiSupport = true;
    enable = true;
    default = "Windows";

    # set $FS_UUID to the UUID of the EFI partition
    extraEntries = ''
      menuentry "Windows" {
        insmod part_gpt
        insmod fat
        insmod search_fs_uuid
        insmod chain
        search --fs-uuid --set=root F655-A2C5
        chainloader /EFI/Microsoft/Boot/bootmgfw.efi
      }
    '';
    };
  };

  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

}

