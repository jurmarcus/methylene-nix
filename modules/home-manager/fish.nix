{ ... }:
{
  programs.fish = {
    enable = true;
    preferAbbrs = true;
    shellAbbrs = {
      drs = "sudo darwin-rebuild switch --flake ~/Code/methylene-nix";
    };
  };
}
