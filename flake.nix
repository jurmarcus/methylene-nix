{
  description = "methylene nix-darwin (modular, multi-host, macOS only)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, ... }:
  let
    system = "aarch64-darwin";

    hostDirs = builtins.attrNames (builtins.readDir ./hosts);

    mkDarwinHost = hostName:
      nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = {
          inherit inputs system;
          primaryUser = "methylene";
        };
        modules = [
          { networking.hostName = hostName; }
          ./hosts/${hostName}
          ./modules/darwin
          ./modules/home-manager

          { system.configurationRevision = self.rev or self.dirtyRev or null; }
        ];
      };

    darwinCfgs = builtins.listToAttrs (map (hn: { name = hn; value = mkDarwinHost hn; }) hostDirs);
  in
  {
    darwinConfigurations = darwinCfgs;
  };
}