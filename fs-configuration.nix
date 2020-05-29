{ config, pkgs, ... }:

{
  # Root filesystem.
  #
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/9b21328e-e925-4bd9-9cb0-c37d4cb5bb32";
      fsType = "btrfs";
      options = [ "subvol=nixos" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-uuid/9b21328e-e925-4bd9-9cb0-c37d4cb5bb32";
      fsType = "btrfs";
      options = [ "subvol=nixos/volumes/var" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/tmp" =
    { device = "/dev/disk/by-uuid/9b21328e-e925-4bd9-9cb0-c37d4cb5bb32";
      fsType = "btrfs";
      options = [ "subvol=nixos/volumes/tmp" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/dc12fafa-47e3-4f7c-a6a4-f3c14e06b4ff";
      fsType = "ext4";
      options = [ "noatime" ];
    };

  # Encrypted partitions.
  #
  boot.initrd.luks.devices."cr1-home" = {
      device = "/dev/disk/by-uuid/0184c496-d27d-4c70-88f6-d0b7aaed1e17";
    };

  boot.initrd.luks.devices."cr2-data" = {
      device = "/dev/disk/by-uuid/75236c0e-cad4-43a7-986c-a5f82f68cf65";
    };

  fileSystems."/home" =
    { device = "/dev/mapper/cr1-home";
      fsType = "btrfs";
      options = [ "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/.cache" =
    { device = "/dev/mapper/cr1-home";
      fsType = "btrfs";
      options = [ "subvol=mdo/.cache" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/.m2" =
    { device = "/dev/mapper/cr1-home";
      fsType = "btrfs";
      options = [ "subvol=mdo/.m2" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/.mozilla" =
    { device = "/dev/mapper/cr1-home";
      fsType = "btrfs";
      options = [ "subvol=mdo/.mozilla" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/.thunderbird" =
    { device = "/dev/mapper/cr1-home";
      fsType = "btrfs";
      options = [ "subvol=mdo/.thunderbird" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/.config" =
    { device = "/dev/mapper/cr1-home";
      fsType = "btrfs";
      options = [ "subvol=mdo/.config" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/mnt/data" =
    { device = "/dev/mapper/cr2-data";
      fsType = "btrfs";
      options = [ "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/Music" =
    { device = "/dev/mapper/cr2-data";
      fsType = "btrfs";
      options = [ "subvol=music" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/Pictures" =
    { device = "/dev/mapper/cr2-data";
      fsType = "btrfs";
      options = [ "subvol=pictures" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/ISO" =
    { device = "/dev/mapper/cr2-data";
      fsType = "btrfs";
      options = [ "subvol=iso" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/VirtualMachines" =
    { device = "/dev/mapper/cr2-data";
      fsType = "btrfs";
      options = [ "subvol=virtualmachines" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/android" =
    { device = "/dev/mapper/cr2-data";
      fsType = "btrfs";
      options = [ "subvol=android" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/Backups" =
    { device = "/dev/mapper/cr2-data";
      fsType = "btrfs";
      options = [ "subvol=backups" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/Videos" =
    { device = "/dev/mapper/cr2-data";
      fsType = "btrfs";
      options = [ "subvol=videos" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/src" =
    { device = "/dev/mapper/cr2-data";
      fsType = "btrfs";
      options = [ "subvol=src" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/Media" =
    { device = "/dev/mapper/cr2-data";
      fsType = "btrfs";
      options = [ "subvol=media" "noatime" "space_cache" "autodefrag" ];
    };

  fileSystems."/home/mdo/Downloads" =
    { device = "/dev/mapper/cr2-data";
      fsType = "btrfs";
      options = [ "subvol=downloads" "noatime" "space_cache" "autodefrag" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/99be5bc9-fac4-4386-83c0-63632edef9dc"; }
    ];
}
