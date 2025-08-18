{ config, lib, pkgs, ... }:
{
  home = {
    stateVersion = "24.05";
    packages = [ pkgs.git ];
  }

  programs.fish = {
    enable = true;
    shellAbbrs = {
      drs = "sudo darwin-rebuild switch --flake ~/Code/methylene-nix";
    };
  };
}
