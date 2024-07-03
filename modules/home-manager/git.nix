{ pkgs, lib, config, ... }:
with lib;
{
  options = {
    git.enable = mkEnableOption "enables git";
    git.userName = mkOption {
      type = types.str;
      default = "";
    };
    git.email = mkOption {
      type = types.str;
      default = "";
    };
    git.signingKey = mkOption {
      type = types.str;
      default = "";
    };
  };
  
  config = mkIf config.git.enable {
    home.file.".config/git/.2F-config" = {
      text = ''
      [user]
      email = "anthony.butt@secondfront.com"
      '';
    };
    programs.git = {
      package = pkgs.gitFull;
      enable = true;
      userName = config.git.userName;
      userEmail = config.git.email;
      signing = {
        key = config.git.signingKey;
        signByDefault = true;
        gpgPath = "gpg";
      };
      includes = [
        {
          condition = "hasconfig:remote.*.url:https://code.il2.gamewarden.io*/**";
          path = "~/.config/git/.2F-config";
        }
      ];
      extraConfig = {
        core.askPass = "";
        init.defaultBranch = "main";
        credential.helper = "store";
      };
    };
  };
}
