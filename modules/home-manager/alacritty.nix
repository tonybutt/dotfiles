{ config, lib, ... }:
with lib;
{
  options = {
    alacritty.enable = mkEnableOption "enables alacritty";
  };

  config = mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
    };
  };
}
