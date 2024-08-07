{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options = {
    zsh.enable = mkEnableOption "enables zsh";
  };

  config = mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = ./.;
          file = "p10k.zsh";
        }
      ];
      shellAliases =
        let
          flakeDir = "~/.dotfiles";
        in
        {
          rb = "nh os switch ${flakeDir} --ask";
          upd = "nix flake update ${flakeDir}";
          upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

          conf = "nvim ${flakeDir}/hosts/mantra/configuration.nix";
          pkgs = "nvim ${flakeDir}/nixos/modules/packages.nix";

          ll = "ls -l";
          v = "nvim";
          se = "sudoedit";
          ff = "fastfetch";
        };

      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
          "z"
          "direnv"
        ];
      };
    };
  };
}
