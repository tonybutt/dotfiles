{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Editors
    vim
    
    # Coding
    git

    # Utils
    tree
    
    waybar
    xwayland
    wl-clipboard
    cliphist
    hyprland
    
    pipewire
    pulseaudio
    pamixer
    
    neofetch
    dmenu
    ranger
    seatd
    xdg-desktop-portal-hyprland 
    swww 
    rofi
    wofi
    alacritty
    ffmpeg
    obs-studio
    amdvlk
  ];
}
