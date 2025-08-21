{ inputs, config, ... }:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = { inherit inputs; };

    users.${config.my.primaryUser} = import ./${config.my.primaryUser};

    sharedModules = [
      inputs.agenix.homeManagerModules.default
    ];
  };

}
