{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
{
  options = {
    brave.enable = mkEnableOption "enables brave";
  };

  config = mkIf config.brave.enable {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        { id = "nngceckbapebfimnlniiiahkandclblb"; }
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
        { id = "jlmpjdjjbgclbocgajdjefcidcncaied"; }
      ];
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    };
  };
}
