{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  keyPath = "${config.home.homeDirectory}/.ssh/github";
in
{
  imports = [
    ../fish.nix
    inputs.nix4nvchad.homeManagerModules.default
  ];

  home = {
    stateVersion = "24.05";
    packages = with pkgs; [
      git
      nixfmt
    ];
  };

  programs.git = {
    enable = true;
    userName = "Jurmarcus Allen";
    userEmail = "me@jurmarcus.com";
  };

  programs.ssh = {
    enable = true;

    extraConfig = ''
      AddKeysToAgent yes
      UseKeychain yes
    '';

    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/github";
        identitiesOnly = true;
      };
    };
  };

  programs.nvchad = {
    enable = true;
    neovim = pkgs.neovim;
  };

  home.activation.ensureSshDir = lib.hm.dag.entryBefore [ "writeBoundary" ] ''
    mkdir -p "${config.home.homeDirectory}/.ssh"
    chmod 700 "${config.home.homeDirectory}/.ssh"
  '';

  home.activation.addGithubKey = lib.hm.dag.entryAfter [ "ensureSshDir" ] ''
    if [ -f "${keyPath}" ]; then
      /usr/bin/ssh-add --apple-use-keychain "${keyPath}" >/dev/null 2>&1 || true
    fi
  '';
}
