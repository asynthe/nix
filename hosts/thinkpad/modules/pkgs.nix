{ config, pkgs, ... }: {

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)

      # freeimage ?
      #imv # Image viewer.
      imv

      # Programs
      alacritty kitty
      neovim
      git
      tmux lf htop
      librewolf ungoogled-chromium
      tor-browser
      pavucontrol
      wget curl
      killall
      tree

      # GUI
      qbittorrent
      pcmanfm

      # Pass
      wl-clipboard
      pass-wayland

      # Wayland
      wofi # App launcher.
      swww # Wallpaper.
      mpvpaper # Video wallpaper.
      grim slurp # Screenshot.
      ripdrag

      # Music
      cmus
      mpd
      ncmpcpp
      spotify

      waybar # Bar
      swayidle # Idle daemon
      mako libnotify # Notification daemon
      wdisplays #wlr-randr #kanshi
      brightnessctl #brillo
      # Disabled
      # Lock Screen
      #gtklock
      #swaylock-effects
      #wlogout
      #eww-wayland # status bar
      ;

    inherit (pkgs.libsForQt5) polkit-kde-agent; # Authentication Agent
    inherit (pkgs.libsForQt5.qt5) qtwayland;
    #inherit (pkgs.qt6) qtwayland; # Qt Wayland Support
    #inherit (pkgs.xorg) xlsclients; # Check for apps running on xwayland
    #inherit (pkgs.xfce) xfce4-terminal mousepad;
  };

}
