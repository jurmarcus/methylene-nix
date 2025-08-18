{ pkgs, primaryUser, ... }:
{
  imports = [
    ./homebrew.nix
  ];

  users.users.${primaryUser} = {
    name = "${primaryUser}";
    home = "/Users/${primaryUser}";
    shell = pkgs.fish;
  };

  system.stateVersion = 6;
}
