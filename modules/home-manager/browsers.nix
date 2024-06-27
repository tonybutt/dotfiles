{pkgs, ...}:{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; }
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
    ];
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
    ];
  };
}
