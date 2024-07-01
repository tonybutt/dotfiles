{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vulnix # scan command: vulnix --system
    clamav # scan command: sudo freshclam; clamscan [options] [file/directory/-]
    chkrootkit # scan command: sudo chkrootkit
  ];
  security.pam.services.hyprlock = { };
}
