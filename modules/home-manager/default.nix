{ inputs, config, ... }:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.sharedModules = [
    inputs.agenix.homeManagerModules.default
  ];

  home-manager.users.${config.my.primaryUser} = import ./${config.my.primaryUser};
}
