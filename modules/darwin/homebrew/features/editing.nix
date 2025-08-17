{ config, lib, ... }:
let cfg = config.my.homebrew.features.editing;
in {
  options.my.homebrew.features.editing.enable =
    lib.mkEnableOption "Editing (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
        "phoenix-slides"
    ];
    homebrew.masApps = {
        "Photomator" = 1444636541;
    };
  };
}