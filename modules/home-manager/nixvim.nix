{pkgs, ...}:{
  programs.ripgrep.enable = true;
  programs.nixvim = {
    enable = true;
    
    globals.mapleader = " ";
    
    keymaps = [
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>g";
    }
    ];

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    defaultEditor = true;
  
    plugins = {
      telescope.enable = true;
      treesitter = {
        enable = true;
        gccPackage = pkgs.gcc;
      };
      luasnip.enable = true;
      lightline.enable = true;
      lsp = {
        enable = true;
        
        servers = {
          rust-analyzer = {
            enable = true;
            installCargo = true;
          };
          nil-ls = {
            enable = true;
          };
          gopls = {
            enable = true;
          };
        };
      };
    };
  };
}