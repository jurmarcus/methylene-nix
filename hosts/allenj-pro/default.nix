{ pkgs, config, ... }:
{
  imports = [
    ./homebrew.nix
  ];

  my.primaryUser = "allenj";

  users.users.${primaryUser} = {
    name = "${config.my.primaryUser}";
    home = "/Users/${config.my.primaryUser}";
    shell = pkgs.fish;
  };

  system.stateVersion = 6;
}
