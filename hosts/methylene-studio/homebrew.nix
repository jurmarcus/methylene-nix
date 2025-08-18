{ lib, ... }:
{
  my.homebrew.bundles = {
    # ai.enable = true;
    desktop.enable = true;
    developer.enable = true;
    entertainment.enable = true;
    learning.enable = true;
    standard.enable = true;
  };

  homebrew.masApps = lib.mkMerge [
    { "Xcode" = 497799835; }
  ];
}