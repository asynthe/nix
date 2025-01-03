{ config, lib, pkgs, ... }: 
with lib; with types;
let
    cfg = config.meta.system.windows;
in {
    options.meta.system.windows = {
        enable = mkEnableOption "Enable setup for Windows dual-boot or access.";
        disk = mkOption {
            type = nullOr str;
            default = null;
            description = "Specify the device for windows auto-mount";
        };
    };

    config = mkIf cfg.enable {

        time.hardwareClockInLocalTime = true;
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
                ntfs3g
            ;
        };

        # Specify that windows in fstab.
        fileSystems."/home/${config.meta.system.user}/win" = mkIf (cfg.disk !=null) {

            # ADD Option for specifying windows drive?
            device = cfg.disk;
            fsType = "ntfs";
            options = [ "rw" ];
        };
    };
}