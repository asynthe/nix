{ config, ... }: {

    #server.secrets.enable = true;

    imports = [
        ../../secrets/secrets.nix
	#../../secrets/secrets_custom.nix

	../../modules/disko/btrfs_persist.nix

	# Server
	../../modules/srv/boot.nix
	../../modules/srv/fs.nix
	#../../modules/srv/locate.nix
	../../modules/srv/network.nix
        ../../modules/srv/pkgs.nix
	../../modules/srv/settings.nix
	../../modules/srv/user.nix
	#../../modules/srv/xmr.nix

	###### MORE SERVICES ######
	../../modules/sec/clamav.nix
	../../modules/vm/libvirt.nix

	# Monitoring
	../../modules/srv/monitoring/elk.nix
	../../modules/srv/monitoring/endlessh.nix

	# systemd services + timers
	#../../modules/nix/srv/systemd/automount_hdd.nix
	#../../modules/nix/srv/systemd/backup_and_compress.nix
	#../../modules/nix/srv/systemd/qbittorrent.nix
    ];
}