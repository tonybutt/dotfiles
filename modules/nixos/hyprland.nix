{ lib, config, ... }:
with lib;
{
  options = {
    hyprland.enable = mkEnableOption "enables system hyprland";
  };
  config = mkIf config.hyprland.enable { 
    programs.hyprland.enable = true;
  };
}
