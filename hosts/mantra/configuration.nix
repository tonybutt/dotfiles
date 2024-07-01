{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
  ];
  boot.initrd.luks.devices."luks-cb6f0236-b018-4a02-8ec9-04f167a16abc".device = "/dev/disk/by-uuid/cb6f0236-b018-4a02-8ec9-04f167a16abc";
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "24.05";

  hostName = "mantra";
  virtualCamera.enable = true;
  virtualMicrophone.enable = true;
  xserver.enable = true;
  hyprland.enable = true;
}
