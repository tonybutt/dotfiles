{
  programs.wofi = {
    enable = true;
    
    settings = {
      allow_images = true;
      insensitive = true;
    };

    style = ''
* {
      font-family: JetBrains NF;
  }
  
  window {
      background-color: #7c818c;
  }
    '';
  };
}
