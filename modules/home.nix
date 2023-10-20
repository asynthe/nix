{config, ... }: {

  imports = [
    # Home
    ./home/app # Specific apps.
    ./home/game # Videogames and emulators.
    ./home/media # Media apps (Video, audio, dj, ...) and configs.
    ./home/comms.nix
    ./home/jp.nix # Memento video player

    # System tools
    ./sys/home/pkgs.nix # System utilities and tools.

    # Developer tools
    ./home/dev/assembly.nix # Assembly
    ./home/dev/tools.nix # Visual Studio Code
    ./home/dev/latex.nix # LaTeX
    ./home/dev/rust.nix # Python
    ./home/dev/python.nix # Rust

    # Network / Networking
    ./net/home/pkgs.nix # Networking and packages.

    # Cybersecurity
    ./sec/home/pkgs.nix # Cybersecurity apps and packages.

    # Audio
    ./snd/home/daw.nix # Audio and sound packages.
    ./snd/home/pkgs.nix # Audio apps and packages.

    # systemd Timers / Cron jobs
    #./timer # systemd timers and cron jobs.

    # Window Managers
    #./wm/hyprland # Hyprland configuration.
    #./wm/xmonad # xmonad configuration.
    #./wm/yabai # yabai configuration. (macOS)
  ];
}
