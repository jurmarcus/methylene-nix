{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    git
  ];

  programs.nvchad = {
    enable = true;
    neovim = pkgs.neovim;
  };

  programs.fish = {
    enable = true;
    preferAbbrs = true;
    shellAbbrs = {
      drs = "sudo darwin-rebuild switch --flake ~/Code/methylene-nix";
    };
  };
}
