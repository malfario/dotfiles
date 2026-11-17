{ ... }:

{
  users.groups.media = {
    gid = 2000;
  };

  users.users.rleblic.extraGroups = [ "media" ];
  users.users.plex.extraGroups = [ "media" ];

  fileSystems."/mnt/media" = {
    device = "/dev/disk/by-uuid/09f64eaf-1f48-4d6b-9e2d-930219dee0b4";
    fsType = "ext4";

    options = [
      "rw"
      "noatime"
      "nofail"
    ];
  };
}
