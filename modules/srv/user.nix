{ config, user, sops-nix, ... }: {

    sops.secrets."password/server".neededForUsers = true;
    users.mutableUsers = false; # Required for passwords set by sops.

    users.users = {
        admin = {
            isNormalUser = true;
	    description = "admin";
	    hashedPasswordFile = config.sops.secrets."password/server".path;
	    extraGroups = [ "networkmanager" "wheel" ];
	};

        ${user} = {
            isNormalUser = true;
	    description = "share";
	    hashedPasswordFile = config.sops.secrets."password/server".path;
	    extraGroups = [ "networkmanager" "wheel" ];
	};

	root.openssh.authorizedKeys.keys = [ # SECRET
	    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY8tUQ59AvWkt0pTSMz2bf3O7emcO37IaA8vZCnXisk bendunstan@protonmail.com"
        ];
    };
}
