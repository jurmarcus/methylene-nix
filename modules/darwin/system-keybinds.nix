{
  pkgs,
  lib,
  config,
  ...
}:
{
  system.defaults.CustomUserPreferences = {
    "com.apple.symbolichotkeys" = {
      AppleSymbolicHotKeys = {
        "64".enabled = false;
        "65".enabled = false;
      };
    };
  };
}
