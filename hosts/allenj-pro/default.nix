{
  pkgs,
  config,
  lib,
  ...
}:
{
  my.primaryUser = "allenj";

  my.homebrew.bundles = {
    desktop.enable = true;
    developer.enable = true;
    entertainment.enable = true;
    standard.enable = true;
  };
}
