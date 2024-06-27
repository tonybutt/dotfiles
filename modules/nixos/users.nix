{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.anthony = {
      isNormalUser = true;
      description = "Anthony";
      extraGroups = [ "networkmanager" "wheel" "input" ];
      packages = with pkgs; [];
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "anthony";
}
