{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options = {
    vscode.enable = mkEnableOption "enables vscode";
  };

  config = mkIf config.vscode.enable {
    # Install nix LSP nil
    home.packages = [ pkgs.nil ];

    programs.vscode = {
      enable = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        ms-vsliveshare.vsliveshare
        rust-lang.rust-analyzer
        golang.go
        eamodio.gitlens
        ms-python.python
        jnoortheen.nix-ide
      ];

      userSettings = {
        "files.autoSave" = "afterDelay";
        "editor.fontLigatures" = true;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "window.menuBarVisibility" = "hidden";
        "liveshare.languages.allowGuestCommandControl" = true;
      };
    };
  };
}
