{ pkgs, lib, ... }:
with lib;
{
  imports = [
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/default.nix
  ];

  config =
    let
      firstName = "Anthony";
      lastName = "Butt";
    in
    {
      home = {
        username = strings.toLower firstName;
        homeDirectory = strings.toLower "/home/${firstName}";
        stateVersion = "24.05";
        packages = with pkgs; [ jq sops ];
      };

      git = {
        enable = true;
        userName = strings.concatStrings [
          "${firstName}"
          " ${lastName}"
        ];
        email = "anthony@abutt.io";
        signingKey = "4C66EAE99B0950AAEED2133CF56C1FE0C44B03BE";
      };
    };
}
