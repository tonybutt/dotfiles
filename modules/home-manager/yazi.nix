{pkgs, ...}:{
  home.packages = [ pkgs.ueberzug ];
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
}
