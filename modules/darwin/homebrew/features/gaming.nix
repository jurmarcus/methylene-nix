{ config, lib, ... }:
let
  cfg = config.my.homebrew.features.gaming;
in
{
  options.my.homebrew.features.gaming.enable = lib.mkEnableOption "Gaming (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "crossover"
    ];
  };
}
