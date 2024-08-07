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
    gcc
    zola
    go
    rustup
    rustc
    rustPackages.clippy
    rust-analyzer
    rustfmt
    cargo
    nixd

    # Music
    spotify
    mpv

    # Utils
    tree
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

    # Screenshot
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
    xdg-desktop-portal-hyprland

    # Sound
    pipewire
    pulseaudio
    pamixer
    pavucontrol

    # Launchers
    dmenu

    # GTK Themes
    nwg-look

    # Qt App Theming
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
