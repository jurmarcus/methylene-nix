{ config, lib, ... }:
let cfg = config.my.homebrew.features.utilities;
in {
  options.my.homebrew.features.utilities.enable =
    lib.mkEnableOption "Utilities (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "raycast"
      "appcleaner"
      "the-unarchiver"
      "localsend"
      "jordanbaird-ice"
    ];
  };
}