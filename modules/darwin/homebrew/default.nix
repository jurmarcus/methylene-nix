{ lib, ... }:
let
  brews  = import ./brews.nix;
  casks  = import ./casks.nix;
  mas    = import ./mas.nix;
in
{
  homebrew = {
    enable  = true;

    brews   = brews;
    casks   = casks;
    masApps = mas;

    onActivation = {
      cleanup    = "zap";
      autoUpdate = true;
      upgrade    = true;
    };
  };
}