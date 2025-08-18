{ config, lib, ... }:
{
  options.my.homebrew.bundles.llm.enable =
    lib.mkEnableOption "LLM bundle (Homebrew)";

  config = lib.mkIf config.my.homebrew.bundles.llm.enable {
    my.homebrew.features = {
      llm.enable = true;
    };
  };
}