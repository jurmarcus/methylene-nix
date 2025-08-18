{ config, lib, pkgs, ... }:
{
  home.stateVersion = "24.05";

  programs.fish.enable = true;
  home.packages = [ pkgs.git ];
}
