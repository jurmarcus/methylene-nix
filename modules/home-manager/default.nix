{ inputs, primaryUser, ... }:
{
  # Bring in Home Manager as a nix-darwin module
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  # Keep it lightweight
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # Your user’s HM config (add others later if you add hosts/users)
  home-manager.users.${primaryUser} = import ./methylene;
}