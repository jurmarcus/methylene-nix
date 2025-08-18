{
  pkgs,
  lib,
  config,
  ...
}:
{
  system = {
    primaryUser = "${config.my.primaryUser}";
    defaults = {
      dock = {
        autohide = true;
        orientation = "left";
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
