{
  imports = [
    ./zsh.nix
    ./modules/default.nix
  ];

  home = {
    username = "anthony";
    homeDirectory = "/home/anthony";
    stateVersion = "24.05";
  };
}
