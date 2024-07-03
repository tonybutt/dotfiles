{ lib, config, ... }:
with lib;
{
  options = {
    virtualCamera.enable = mkEnableOption "enables virtual camera";
    virtualMicrophone.enable = mkEnableOption "enables virtual microphone";
  };

  config = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    services.passSecretService.enable = true;
    programs.seahorse.enable = true;
    boot.extraModulePackages = mkIf config.virtualCamera.enable [
      config.boot.kernelPackages.v4l2loopback.out
    ];
    boot.kernelModules = [
      # Virtual Camera
      (strings.optionalString config.virtualCamera.enable "v4l2loopback")
      # Virtual Microphone
      (strings.optionalString config.virtualMicrophone.enable "snd-aloop")
    ];
    boot.extraModprobeConfig = strings.concatStrings [
      (strings.optionalString config.virtualCamera.enable ''options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"'')
      (strings.optionalString config.virtualMicrophone.enable "\noptions snd_usb_audio vid=0x1235 pid=0x8212 device_setup=1")
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
