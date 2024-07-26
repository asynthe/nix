{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.boot;
in {
    options.meta.boot.silent = mkOption {
        type = bool;
        default = false;
        description = ''
          Enable the configuration for a silent boot (almost possible, because of nix stages output at boot).
        '';
    };

    config = mkIf cfg.silent {
        boot = {
            consoleLogLevel = 0;
            initrd.verbose = false;
            kernelParams = [
                "quiet"
                "splash"
                "vga=current"
                "rd.systemd.show_status=false"
                "rd.udev.log_level=3"
                "udev.log_priority=3"
                "boot.shell_on_fail"
                "rd.udev.log_priority=3"
                "button.lid_init_state=open"
                "log_level=3"
            ];
        };
    };
}
