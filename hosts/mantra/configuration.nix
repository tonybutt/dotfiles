{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../nixos/modules/default.nix
    ];
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.initrd.preLVMCommands = ''
    ${pkgs.kbd}/bin/setleds +num 
  '';
  boot.initrd.luks.devices."luks-cb6f0236-b018-4a02-8ec9-04f167a16abc".device = "/dev/disk/by-uuid/cb6f0236-b018-4a02-8ec9-04f167a16abc";
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];
  boot.kernelModules = [
    # Virtual Camera
    "v4l2loopback"
    # Virtual Microphone
    "snd-aloop"
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
  '';
  networking.hostName = "mantra"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

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

  services.xserver = {	
    enable = true;
    displayManager = { 
      gdm.enable = true;
      setupCommands = ''
        ${pkgs.numlockx}/bin/numlockx on
      '';
    };
    desktopManager = { gnome.enable = true; };
    xkb.layout = "us";
    xkb.variant = "";
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "anthony";
  
  
  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";
}
