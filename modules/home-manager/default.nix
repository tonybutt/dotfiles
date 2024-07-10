{ lib, ... }:
with lib;
{
  imports = [
    ./git.nix
    ./browsers.nix
    ./waybar.nix
    ./alacritty.nix
    ./htop.nix
    ./wofi.nix
    ./hyprland.nix
    ./mako.nix
    ./vscode.nix
    ./hyprlock.nix
    ./nixvim.nix
    ./hypridle.nix
    ./fastfetch.nix
    ./yazi.nix
    ./direnv.nix
  ];

  alacritty.enable = mkDefault true;
  brave.enable = mkDefault true;
  git.enable = mkDefault true;
  htop.enable = mkDefault true;
  vscode.enable = mkDefault true;
  wofi.enable = mkDefault true;
  mako.enable = mkDefault true;
  zsh.enable = mkDefault true;
}
