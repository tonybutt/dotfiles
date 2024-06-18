{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Editors
    vim
    
    # Coding
    git
    screenkey

    # Music
    spotify
    mpv

    # Utils
    tree
    neofetch
    ranger
    seatd
    imv

    # Notifications
    mako

    # Bluetooth
    bluez
    bluez-tools
    
    # Terminals
    alacritty
    
    # Chat
    slack
    signal-desktop

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
    
    # Wallpaper manager 
    swww 
    
    # Launchers 
    dmenu
    rofi
    wofi
    
    # Streaming Virtual Camera Stuff
    ffmpeg
    obs-studio
    amdvlk
    
    # Other
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    papirus-nord
  ];
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
