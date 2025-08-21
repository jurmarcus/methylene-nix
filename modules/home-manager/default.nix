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

  home.packages = with pkgs; [
    git
    nixfmt
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };

    sharedModules = [
      inputs.agenix.homeManagerModules.default
      inputs.nix4nvchad.homeManagerModules.default
      ./common/fish.nix
    ];

    programs.nvchad = {
      enable = true;
      neovim = pkgs.neovim;
    };

    users.${config.my.primaryUser} = import ./${config.my.primaryUser};
  };

}
