{ lib, config, ... }:
with lib;
{
  options = {
    mako.enable = mkEnableOption "enables mako notifications";
  };

  config = mkIf config.mako.enable {
    services.mako = {
      enable = true;
      # Set timeout to 5 seconds
      defaultTimeout = 5000;
    };
  };
}
