{ sefl, pkgs, config, ... }:

#  let 
#       bubblified-theme = pkgs.fetchFromGitHub {
#         owner = "hohmannr";
#         repo = "bubblified";
#         url = "https://github.com/hohmannr/bubblified.git";
#         rev = "master";
#         sha256 = "1kvphzsnnpb1fl4j9a7dlzny4svbb9zqdyb7q69vks2wbpr61ha2";
#       }; 
#     in 
#
{

    # programs.fish = {
    #     enable = true;
    #     interactiveShellInit = ''
    #         set fish_greeting # Disable greeting
    #     '';
    # };

    programs.thefuck.enable = true;

      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
          ll = "ls -l";
          edit = "sudo -e";
          update = "sudo nixos-rebuild switch";
        };

        history.size = 10000;
        history.ignoreAllDups = true;
        history.path = "$HOME/.zsh_history";
        history.ignorePatterns = ["rm *" "pkill *" "cp *"];

        # initExtra = ''
        #   export ZSH_THEME="bubblified"
        # '';

        oh-my-zsh = {
          enable = true;
          plugins = [ "git" "thefuck" ];
        };
      };
   

    programs.kitty = {
        enable = true;

        settings = {
            confirm_os_window_close = "0";
            shell = "${pkgs.zsh}/bin/zsh";
            font_family = "Cascadia Code Mono";
            font_size = 12;
            background = "#202020";
        };
    };

}
