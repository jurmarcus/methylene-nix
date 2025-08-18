{ config, lib, ... }:
{
  options.my.homebrew.bundles.editing.enable =
    lib.mkEnableOption "Editing bundle (Homebrew)";

  config = lib.mkIf config.my.homebrew.bundles.editing.enable {
    my.homebrew.features = {
      editing.enable = true;
    };
  };
}
