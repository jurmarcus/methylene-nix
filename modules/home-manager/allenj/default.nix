{ config, lib, pkgs, ... }:
{
  imports = [ 
    ../fish.nix 
  ];

  home = {
    stateVersion = "24.05";
    packages =  with pkgs; [ 
      git
      nixfmt
    ];
  };
}
