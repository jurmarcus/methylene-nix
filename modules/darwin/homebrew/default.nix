{ config, lib, ... }:
{
  imports = [
    # Features
    ./features/llm.nix
    ./features/browsers.nix
    ./features/communication.nix
    ./features/developer.nix
    ./features/hardware.nix
    ./features/learning.nix
    ./features/entertainment.nix
    ./features/security.nix
    ./features/utilities.nix
    ./features/editing.nix

    # Bundles
    ./bundles/llm.nix
    ./bundles/desktop.nix
    ./bundles/developer.nix
    ./bundles/entertainment.nix
    ./bundles/learning.nix
    ./bundles/standard.nix
  ];

  config = {
    homebrew = {
      enable = true;
      brews   = [ ];
      casks   = [ ];
      masApps = { };

      onActivation = {
        cleanup    = "zap";
        autoUpdate = true;
        upgrade    = true;
      };
    };
  };
}