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
            value = {
              type = "standard";
              parameters = [ 32 49 1048576 ];
            };
          };
          "65" = {
            enabled = false;
            value = {
              type = "standard";
              parameters = [ 32 49 1572864 ];
            };
          };
        };
      };
    };
  };
}