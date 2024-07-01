{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  environment.systemPackages = mkIf config.virtualMicrophone.enable [ pkgs.alsa-scarlett-gui ];

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
