{ sefl, pkgs, config, ... }:

{

# programs.fish = {
#     enable = true;
#     interactiveShellInit = ''
#         set fish_greeting # Disable greeting
#     '';
# };

# ADD CPU FREQ LOCK ALIES
  # programs.thefuck.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      backupMyFlake = ''initial_directory="$(pwd)" && cd /home/hryu/nixos-dotfiles/flake\ backups && dir_name="$(date +%d_%m_%Y_%H:%M:%S)" && mkdir "$dir_name" && cp ../flake.nix "$dir_name" && cp ../flake.lock "$dir_name" && cd "$initial_directory"'';
      updateMyWholeFlake = ''backupMyFlake && cd /home/hryu/nixos-dotfiles/ && nix flake update && "$initial_directory"'';
      newBuild = "sudo nixos-rebuild switch --flake /home/hryu/nixos-dotfiles/";
      homeUpdate = "home-manager switch --flake /home/hryu/nixos-dotfiles/";
      clean = "nix-collect-garbage";
      CCS = "nix-shell /home/hryu/nixos-dotfiles/shells/gcc/shell.nix --command zsh";
    };

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];

    initContent = ''
      eval "$(starship init zsh)"
      '';

    # oh-my-zsh = {
    #   enable = true;
    #   theme = "gnzh";
    #   plugins = [ "git" "thefuck" ];
    # };
  };


  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = "0";
      shell = "${pkgs.zsh}/bin/zsh";
      font_family = "SourceCodePro-Regular";
      font_size = 14;
      background = "#202020";
    background_opacity = "0.9";
    background_blur = 2;
    window_margin_width = 30;
    };
  };

  programs.starship = {
    enable = true;
    # settings = {
    #
    # };
  };

}
