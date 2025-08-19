{
  pkgs,
  lib,
  config,
  ...
}:
{
  system.defaults = {
    CustomUserPreferences = {
      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          "60" = {
            enabled = false;
          };
          "61" = {
            enabled = false;
          };
          "64" = {
            enabled = false;
          };
          "65" = {
            enabled = false;
          };
        };
      };
    };
  };
}
