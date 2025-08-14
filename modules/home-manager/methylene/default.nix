{ pkgs, ... }:
{
  home.stateVersion = "24.05";

  programs.ssh = {
    enable = true;

    extraConfig = ''
      AddKeysToAgent yes
      UseKeychain yes
    '';

    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/github";
        identitiesOnly = true;
      };
    };
  };

  home.packages = [ pkgs.git ];
}