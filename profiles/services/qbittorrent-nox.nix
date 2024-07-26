{ config, lib, pkgs, ... }:
with lib; with types; 
let
    cfg = config.meta.services.qbittorrent-nox;
in {
    options.meta.services.qbittorrent-nox = {
        enable = mkOption {
            type = bool;
            default = false;
            description = ''
              Set up the qBittorrent-nox daemon.
            '';
        };
        persistence = mkOption {
            type = bool;
            default = false;
            description = ''
              Sets up persistence for qBittorrent configuration files.
            '';
        };
    };

    config = mkIf cfg.enable {

	    # See the logs by running.
        # journalctl -u qbittorrent-nox.service

        # ADD persistence option.
        #environment.persistence."/persist".directories = mkIf cfg.persist [
            #{
                #directory = "${cfg.dataDir}";
                #user = "${cfg.user}";
                #group = "${cfg.group}";
                #mode = "0750";
            #}
        #];

        # system.configuration.type = "server"; ?
        #environment.systemPackages = mkIf config.persistence builtins.attrValues { inherit (pkgs-stable) qbittorrent-nox; };
        environment.systemPackages = builtins.attrValues { inherit (pkgs) qbittorrent-nox; };

        networking.firewall = {
            allowedTCPPorts = [ 8080 ];
            allowedUDPPorts = [ 8080 ];
        };

        systemd.user.services.qbittorrent-nox = {
            description = "qBittorrent-nox service";
            path = [ pkgs.qbittorrent-nox ];
            after = [ "network.target" ];
            wantedBy = [ "default.target" "multi-user.target" ];
            serviceConfig = {
                Type = "simple";
                ExecStart = ''
                  ${pkgs.qbittorrent-nox}/bin/qbittorrent-nox
                '';
            };
        };
    };
}
