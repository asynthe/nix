{ config, lib, pkgs, ... }: {

    programs.wezterm = {
        enable = true;
        enableBashIntegration = config.programs.bash.enable;
        enableZshIntegration = config.programs.zsh.enable;
        extraConfig = builtins.readFile ../../../../dots/wezterm/config.lua;
	    #extraConfig = config.lib.file.mkOutOfStoreSymlink ./config.lua;
    };

    programs.zsh.shellAliases = lib.mkIf config.programs.zsh.enable {
        img = "wezterm imgcat";
    };

    home = {
        sessionVariables = { TERM = "wezterm"; };
        packages = builtins.attrValues {
            inherit (pkgs)
                alsa-utils
            ;
        };
    };
}
