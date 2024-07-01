{ pkgs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };
  programs.appgate-sdp.enable = true;
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

    # Bluetooth
    bluez
    bluez-tools

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
    hyprland

    # Sound
    pipewire
    pulseaudio
    pamixer
    pavucontrol

    # Launchers
    dmenu
    nwg-look

    qt5ct
    qt6ct
    # Streaming Virtual Camera Stuff
    ffmpeg
    obs-studio
    amdvlk
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
    (nerdfonts.override {
      fonts = [
        "NerdFontsSymbolsOnly"
        "FiraCode"
      ];
    })
  ];
}
