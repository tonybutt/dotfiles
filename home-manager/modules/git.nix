{
  programs.git = {
    enable = true;
    userName = "Anthony Butt";
    userEmail = "anthony@abutt.io";
    signing = { 
      key = "4C66EAE99B0950AAEED2133CF56C1FE0C44B03BE";
      signByDefault = true;
      gpgPath = "gpg";
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
