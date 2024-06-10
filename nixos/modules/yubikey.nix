{pkgs, ...}: {
  
services.pcscd.enable = true;

environment.systemPackages = with pkgs; [
  gnupg
  yubikey-manager
];

}
