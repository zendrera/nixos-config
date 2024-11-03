{ config, pkgs, ... }:

{
  # Load the cifs package
  environment.systemPackages = [ pkgs.cifs-utils ];

  # Mount each NAS share
  fileSystems."/mnt/books" = {
    device = "//192.168.1.50/books";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";

    in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
  };
  fileSystems."/mnt/downloads" = {
    device = "//192.168.1.50/downloads";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";

    in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
  };
  fileSystems."/mnt/music" = {
    device = "//192.168.1.50/music";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";

    in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
  };
  fileSystems."/mnt/video" = {
    device = "//192.168.1.50/video";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";

    in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
  };
  #Optional shares (backup, nrp, photo...)
  #fileSystems."/mnt/x" = {
  #  device = "//192.168.1.50/x";
  #  fsType = "cifs";
  #  options = let
  #    # this line prevents hanging on network split
  #    automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";

  #  in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
  #};

}
