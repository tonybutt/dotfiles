{ pkgs, zed-pkgs, lib, ... }:
{
  imports = [
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/default.nix
  ];

  config =
    let
      firstName = "Anthony";
      lastName = "Butt";
      zed-fhs = zed-pkgs.buildFHSUserEnv {
        name = "zed";
        targetPkgs = pkgs:
          with zed-pkgs; [
            zed-editor
          ];
        runScript = "zed";
      };
    in
    {
      home = {
        username = lib.strings.toLower firstName;
        homeDirectory = lib.strings.toLower "/home/${firstName}";
        stateVersion = "24.05";
        packages = [ pkgs.jq pkgs.sops zed-fhs pkgs.pulumi-bin ];
      };

      git = {
        enable = true;
        userName = lib.strings.concatStrings [
          "${firstName}"
          " ${lastName}"
        ];
        email = "anthony@abutt.io";
        signingKey = "4C66EAE99B0950AAEED2133CF56C1FE0C44B03BE";
      };
    };
}
