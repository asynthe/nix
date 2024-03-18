{ config, pkgs, username, ... }: {

    programs.zsh = {
        enable = true;
	defaultKeymap = "vicmd"; # `emacs`, `vicmd`, `viins`.

	# No comments...
	dotDir = ".config/zsh";
	#dotDir = "${username}";
	#dotDir = "/home/${username}/.config/zsh";
	#dotDir = "${config.xdg.configHome}/zsh";

	# Configuration
	autocd = true;
	history.size = 10000;

	# Variables
	sessionVariables = {

	    #TERM="xterm-256color"; # ?
	    BROWSER="firefox";
	    READER="zathura";
	    FILE="lf";
	    EDITOR="nvim";

	    #GNUPGHOME="/home/${username}/sync/pass/gpg"; # SECRET
	    #PASSWORD_STORE_DIR="/home/${username}/sync/pass/pass" # SECRET
	    #STARSHIP_CONFIG="/home/${username}/.config/starship/starship.toml"
	    #WAYFIRE_CONFIG_FILE="/home/${username}/.config/wayfire/wayfire.ini" # -> wayfire.nix

	};

	# ...
	#initExtra = {
	    #TMOUT=420;
            #TRAPALRM() { unimatrix -s 93 }
            #TRAPALRM() { pipes-rs }
	#};

        # Aliases
        shellAliases = {
	    ssh = "ssh -i /home/${username}/sync/pass/ssh/wsl/wsl"; # SECRET
	    lf = "lfcd";
	    py = "python3";

	    # Nix
	    update = "nix flake update ${config.xdg.configHome}/yuugen";
	    #upgrade = "sudo nixos-rebuild switch --flake ${config.xdg.configHome}/yuugen#thinkpad"; 
	    #upgrade-home = "home-manager switch --flake ${config.xdg.configHome}/yuugen#ben"; 
	    upgrade-wsl = "home-manager switch --flake ${config.xdg.configHome}/yuugen#missingno";
	    gc = "sudo nix-collect-garbage -d";
        };

	# Plugins
	autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
	#plugins.<> = {
	    #name = ;
	    #file = ;
	    #src = ;
	#};
    };

    programs = {
        broot.enableZshIntegration = true;
        direnv.enableZshIntegration = true;
        eza.enableZshIntegration = true;
        fzf.enableZshIntegration = true;
	skim.enableZshIntegration = true;
        #pyenv.enableZshIntegration = true;
	zoxide.enableZshIntegration = true;
    };
}
