{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    ./primary-user.nix
    ./system-keybinds.nix
    ./system-settings.nix
    ./homebrew

    inputs.nix-homebrew.darwinModules.nix-homebrew
    inputs.agenix.darwinModules.default
  ];

  system.stateVersion = 6;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.variables.EDITOR = "nvim";
  environment.shells = [ pkgs.fish ];
  environment.systemPackages = with pkgs; [
    inputs.agenix.packages.${pkgs.system}.default
    nixfmt
  ];

  programs.fish = {
    enable = true;
  };

  users.users.${config.my.primaryUser} = {
    name = "${config.my.primaryUser}";
    home = "/Users/${config.my.primaryUser}";
    shell = pkgs.fish;
  };

  # sudo chsh -s /run/current-system/sw/bin/fish $USER
  security.pam.services.sudo_local.touchIdAuth = true;

  nix-homebrew = {
    enable = true;
    user = config.my.primaryUser;
  };
}
