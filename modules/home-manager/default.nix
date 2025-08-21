{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    sharedModules = [
      inputs.agenix.homeManagerModules.default
      inputs.nix4nvchad.homeManagerModules.default
      ./common
    ];

    users.${config.my.primaryUser} = import ./users/${config.my.primaryUser};
  };

}
