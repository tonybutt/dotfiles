{
  programs.git = {
    enable = true;
    userName = "Anthony Butt";
    userEmail = "anthony@abutt.io";
    extraConfig = {
      init.defaultBranch = "main";
      commit.gpgsign = true;
      gpg.program = "gpg";
      user.signingkey = "4C66EAE99B0950AAEED2133CF56C1FE0C44B03BE";
    };
  };
}
