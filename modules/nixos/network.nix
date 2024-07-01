{ lib, config, ... }:
with lib;
{
  options = {
    hostName = mkOption {
      type = types.str;
      default = null;
    };
  };

  config = {
    networking.hostName = config.hostName; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.networkmanager.enable = true;
  };
}
