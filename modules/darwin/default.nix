{ pkgs, inputs, primaryUser, ... }:
{
  imports = [
    ./system-settings.nix
    ./homebrew

    inputs.mac-app-util.darwinModules.default
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];
  environment.variables.EDITOR = "nvim";

  security.pam.services.sudo_local.touchIdAuth = true;

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = primaryUser;
  };
}