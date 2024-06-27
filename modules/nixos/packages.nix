{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  programs.wshowkeys.enable = true;
  environment.systemPackages = with pkgs; [
    # Notifications
    glib
    libnotify
    
    # Editors
    vim
    
    # Coding
    git

    # Music
    spotify
    mpv

    # Utils
    tree
    neofetch
    ranger
    seatd
    imv
    brightnessctl
    wttrbar
    wallust

    # Bluetooth
    bluez
    bluez-tools
    
    # Terminals
    alacritty
    
    # Chat
    slack
    signal-desktop
    discord

    # screenshot
    grim
    grimblast
    slurp
    flameshot
    swappy
 
    # Clipboard 
    wl-clipboard
    cliphist

    # Window Manager
    waybar
    xwayland
    hyprland
    xdg-desktop-portal-hyprland 
    
    # Sound
    pipewire
    pulseaudio
    pamixer
    pavucontrol

    # Wallpaper manager 
    swww 
    
    # Launchers 
    dmenu
    rofi
    
    # Streaming Virtual Camera Stuff
    ffmpeg
    obs-studio
    amdvlk
    
    #Zsh Theme
    zsh-powerlevel10k
    
  ];
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    meslo-lgs-nf
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "FiraCode" ]; })
  ];
}
