{ lib, ... }:
{
  my.homebrew.bundles = {
    llm.enable = true;
    desktop.enable = true;
    developer.enable = true;
    editors.enable = true;
    entertainment.enable = true;
    learning.enable = true;
    standard.enable = true;
  };

  homebrew.masApps = lib.mkMerge [
    { "Xcode" = 497799835; }
  ];
}
