{ pkgs, lib, primaryUser, ... }:
{
  system = {
    primaryUser = "${primaryUser}";
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