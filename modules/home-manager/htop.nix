{ lib, config, ... }:
with lib;
{
  options = {
    htop.enable = mkEnableOption "enables htop";
  };

  config = mkIf config.htop.enable {
    programs.htop = {
      enable = true;
      settings = {
        tree_view = 1;
      };
    };
  };
}
