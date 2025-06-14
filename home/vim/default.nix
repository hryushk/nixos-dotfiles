{ inputs, pkgs, ... }:

{

    home.packages = with pkgs; [
        neovide
    ];

    imports = [
        inputs.nixvim.homeManagerModules.nixvim
    ];

    programs.nixvim = {
        enable = true; 
        clipboard = {
            providers.wl-copy.enable = true; 
            register = "unnamedplus";
        }; 

        # THEME
        colorschemes.oxocarbon.enable = true;


        # MAIN OPTIONS
        opts = {
            number = true;

            tabstop = 4;
            shiftwidth = 4;
            autoindent = true;
            expandtab = true;

            swapfile = false;
        };


        # KEYMAPS
        globals = {
            mapleader = " ";
            maplocalleader = " ";
        };

        keymaps = [ 
        {
            mode = "n";
            action = "<cmd>vsplit<CR>";
            key = "<leader>s";
            options = {
                silent = true;
                noremap = true;
                desc = "Vertical split";
            };
        }

        {
            mode = "n";
            action = "<cmd>close<CR>";
            key = "<leader>c";
            options = {
                silent = true;
                noremap = true;
                desc = "Close tab";
            };
        }

        {
            mode = "i";
            action = "<Left>";
            key = "<C-h>";
            options = {
                silent = true;
                noremap = true;
                desc = "Move cursor on the left in insert mode";
            };
        }

        {
            mode = "i";
            action = "<Right>";
            key = "<C-l>";
            options = {
                silent = true;
                noremap = true;
                desc = "Move cursor on the right in insert mode";
            };
        }

        {
            mode = "i";
            action = "<Up>";
            key = "<C-k>";
            options = {
                silent = true;
                noremap = true;
                desc = "Move cursor up in insert mode";
            };
        }

        {
            mode = "i";
            action = "<Down>";
            key = "<C-j>";
            options = {
                silent = true;
                noremap = true;
                desc = "Move cursor below in insert mode";
            };
        }

        {
            mode = "n";
            action = "<cmd>w<CR>";
            key = "<C-s>";
            options = {
                silent = true;
                noremap = true;
                desc = "Save shortcut";
            };
        }

        {
            mode = "n";
            action = ":";
            key = ";";
        }

        {
            mode = "i";
            action = "{}<left>";
            key = "{";
            options.noremap = true;
        }

        {
            mode = "i";
            action = "()<left>";
            key = "(";
            options.noremap = true;
        }

        {
            mode = "i";
            action = "[]<left>";
            key = "[";
            options.noremap = true;
        }

        {
            mode = "i";
            action = "\"\"<left>";
            key = "\"";
            options.noremap = true;
        }

        {
            mode = "n";   
            action = "<cmd>gcc<CR>";
            key = "<leader>/";
            options.noremap = true;
        }

        {
            mode = "v";
            action = "gc";
            key = "<leader>/";
            options.noremap = true;
        }

        {
            action = "<cmd>MarkdownPreview<CR>";
            key = "<leader>m";
            options.noremap = true;
        }

        ];


        # PLUGINS
        plugins = { 
            markdown-preview = { 
                enable = true;
                settings.theme = "dark";
            };

            lsp = {
                enable = true;
                servers = {
                    ts_ls.enable = true; # TS/JS
                    cssls.enable = true; # CSS
                    tailwindcss.enable = true; # TailwindCSS
                    html.enable = true; # HTML
                    astro.enable = true; # AstroJS
                    phpactor.enable = true; # PHP
                    # svelte.enable = false; # Svelte
                    # vuels.enable = false; # Vue
                    pyright.enable = true; # Python
                    marksman.enable = true; # Markdown
                    nil_ls.enable = true; # Nix
                    dockerls.enable = true; # Docker
                    bashls.enable = true; # Bash
                    clangd.enable = true; # C/C++
                    csharp_ls.enable = true; # C#
                    nixd.enable = true;
                };
            };

            cmp = {
                enable = true;
                settings = {
                    completion = {
                        completeopt = "menu,menuone,noinsert";
                    };
                    autoEnableSources = true;
                    experimental = { ghost_text = true; };
                    performance = {
                        debounce = 60;
                        fetchingTimeout = 200;
                        maxViewEntries = 30;
                    };
                    snippet = { 
                        expand = ''
                            function(args)
                            require('luasnip').lsp_expand(args.body)
                            end
                            '';
                    };
                    formatting = { fields = [ "kind" "abbr" "menu" ]; };
                    sources = [
                   { name = "nvim_lsp"; }
          #          { name = "emoji"; }
                    {
                        name = "buffer"; # text within current buffer
                            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
                        keywordLength = 3;
                    }
                    # { name = "copilot"; } # enable/disable copilot
                    {
                        name = "path"; # file system paths
                            keywordLength = 3;
                    }
                    {
                        name = "luasnip"; # snippets
                            keywordLength = 3;
                    }
                    ];

                    window = {
                        completion = { border = "solid"; };
                        documentation = { border = "solid"; };
                    };

                    mapping = {
                        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
#                        "<C-j>" = "cmp.mapping.select_next_item()";
#                        "<C-k>" = "cmp.mapping.select_prev_item()";
#                        "<C-e>" = "cmp.mapping.abort()";
#                        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
#                        "<C-f>" = "cmp.mapping.scroll_docs(4)";
                        "<C-Space>" = "cmp.mapping.complete()";
#                        "<Enter>" = "cmp.mapping.confirm({ select = true })";
                        "<Enter>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
#                        "<C-l>" = ''
#                            cmp.mapping(function()
#                                    if luasnip.expand_or_locally_jumpable() then
#                                    luasnip.expand_or_jump()
#                                    end
#                                    end, { 'i', 's' })
#                            '';
#                        "<C-h>" = ''
#                            cmp.mapping(function()
#                                    if luasnip.locally_jumpable(-1) then
#                                    luasnip.jump(-1)
#                                    end
#                                    end, { 'i', 's' })
#                            '';
                    };
                };
            };
            cmp-nvim-lsp.enable = true;

            commentary.enable = true;

        };
    };

}

