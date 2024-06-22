{pkgs, ...}: {
    environment.systemPackages = [pkgs.alsa-scarlett-gui];
    boot.extraModprobeConfig = ''
      options snd_usb_audio vid=0x1235 pid=0x8212 device_setup=1
    '';
}
