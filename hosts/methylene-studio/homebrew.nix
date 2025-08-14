{ lib, ... }:
{
  homebrew.masApps = lib.mkMerge [
    { "Xcode" = 497799835; }
  ];
}