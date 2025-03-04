{ inputs, config, pkgs, ... }: {

  # imports = [ inputs.nvchad4nix.homeManagerModule ];
  # programs.nvchad.enable = true;

  home.packages = with pkgs; [
    neovide
  ];
  
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      clangd_extensions-nvim
      null-ls-nvim
      nvim-dap
    ];
  };
}

