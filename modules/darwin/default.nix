{ pkgs, inputs, config, ... }:
{
  imports = [
    ./primary-user.nix
    ./system-settings.nix
    ./homebrew

    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  environment.shells = [ pkgs.fish ];
  environment.variables.EDITOR = "nvim";

  programs.fish.enable = true;

  security.pam.services.sudo_local.touchIdAuth = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = config.my.primaryUser;
  };
}
