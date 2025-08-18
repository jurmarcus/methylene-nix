{ inputs, config, ... }:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
    inputs.agenix.homeManagerModules.default
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.${config.my.primaryUser} = import ./${config.my.primaryUser};
}
