{pkgs, ...}:
{
  stylix = {
    enable = true;
    image = ../../wallpapers/black-hole.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    opacity = {
      terminal = 0.65;
    };
  };
}