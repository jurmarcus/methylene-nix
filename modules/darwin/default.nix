{ pkgs, inputs, config, ... }:
{
  imports = [
    ./primary-user.nix
    ./system-settings.nix
    ./homebrew

    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  environment.variables.EDITOR = "nvim";
  environment.shells = [ pkgs.fish ];
  programs.fish.enable = true;
  # sudo chsh -s /run/current-system/sw/bin/fish $USER

  security.pam.services.sudo_local.touchIdAuth = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = config.my.primaryUser;
  };
}
