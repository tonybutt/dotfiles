{ config, lib, ... }:
with lib;
{
  options = {
    alacritty.enable = mkEnableOption "enables alacritty";
  };

  config = mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        import = [ "~/.cache/wal/colors-alacritty.toml" ];

        font = {
          size = 13.0;
          # draw_bold_text_with_bright_colors = true;
          normal = {
            family = "JetBrains Mono";
            style = "Bold";
          };
        };

        colors.primary.background = "#000000";
      };
    };
  };
}
