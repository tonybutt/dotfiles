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
      extraConfig = {
        core.askPass = "";
        init.defaultBranch = "main";
        credential.helper = "${pkgs.gitFull.override {withLibsecret = true;}}/bin/git-credential-libsecret";
      };
    };
  };
}
