{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options = {
    xserver.enable = mkEnableOption "enabled xserver";
  };

  config = mkIf config.xserver.enable {
    services.xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
    };
  };
}
