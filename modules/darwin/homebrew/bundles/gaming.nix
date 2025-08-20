{ config, lib, ... }:
{
  options.my.homebrew.bundles.gaming.enable = lib.mkEnableOption "Gaming bundle (Homebrew)";

  config = lib.mkIf config.my.homebrew.bundles.gaming.enable {
    my.homebrew.features = {
      gaming.enable = true;
    };
  };
}
