{pkgs, ...}: {
  #programs.zsh = {
  #enable = true;
  #enableAutosuggestions = true;
  #syntaxHighlighting = {
  #enable = true;
  #styles = ;
  #package = ;
  #};
  #initExtra = ''
  #bindkey '^f' autosuggest-accept
  #'';
  #};

  # Packages
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      alacritty
      kitty
      # Shell
      
      zsh
      dash
      fish
      powershell
      nushell
      nu_scripts
      # Replacements
      
      bat # for cat
      eza # for ls
      zoxide # for cd
      fd # for find
      
      # Tools
      starship
      git
      tmux tmuxp
      neovim #vim
      skim #fzf

      # From other note
      
      # Apps
      lf
      ueberzugpp # file manager
      yt-dlp
      ripdrag # drag-and-drop for terminal
      cli-visualizer
      cava # audio visualizer
      pipes-rs #pipes
      peaclock #tty-clock
      cmatrix
      hollywood
      figlet
      lolcat
      pfetch #neofetch #ipfetch #macchina
      pv

      # Customization
      pywal
      wpgtk
      colorz

      # Code formatters
      nixfmt
      alejandra # nix

      # Terminal Apps
      ripgrep
      hyperfine
      tree
      wget
      rsync
      ncdu
      killall
      btop
      htop
      entr
      acpi
      #beets
      offlineimap
      gammastep
      links2
      tldr
      epr
      libcryptui
      broot
      harfbuzz
      pciutils
      curl
      dconf
      fd
      lshw
      fontconfig
      file
      gnumake
      sosreport
      xsos
      #nodejs
      #wmctrl
      xdotool
      neofetch

      trashy
   
      # GUI
      font-manager
      ;
  };
}
