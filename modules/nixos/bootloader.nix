{ lib, config, ... }:
{
  options = {
    virtualCamera.enable = lib.mkEnableOption "enables virtual camera";
    virtualMicrophone.enable = lib.mkEnableOption "enables virtual microphone";
  };

  config = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.greetd.enableGnomeKeyring = true;
    programs.seahorse.enable = true;
    boot.extraModulePackages = lib.mkIf config.virtualCamera.enable [
      config.boot.kernelPackages.v4l2loopback.out
    ];
    boot.kernelModules = [
      # Virtual Camera
      (lib.strings.optionalString config.virtualCamera.enable "v4l2loopback")
      # Virtual Microphone
      (lib.strings.optionalString config.virtualMicrophone.enable "snd-aloop")
    ];
    boot.extraModprobeConfig = lib.strings.concatStrings [
      (lib.strings.optionalString config.virtualCamera.enable ''options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"'')
      (lib.strings.optionalString config.virtualMicrophone.enable "\noptions snd_usb_audio vid=0x1235 pid=0x8212 device_setup=1")
    ];

    boot.plymouth.enable = true;
    boot.initrd.verbose = false;
    boot.initrd.systemd.enable = true;
    boot.consoleLogLevel = 0;
    boot.kernelParams = [
      "quiet"
      "udev.log_level=0"
    ];
  };
}
