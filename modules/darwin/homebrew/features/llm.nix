{ config, lib, ... }:
let cfg = config.my.homebrew.features.llm;
in {
  options.my.homebrew.features.llm.enable =
    lib.mkEnableOption "LLM (Homebrew casks)";
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "lm-studio"
    ];
  };
}