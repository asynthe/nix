{ config, lib, ... }: {

  networking = {

    #wireless.enable = true; # wpa-supplicant

    # Network Manager
    networkmanager = {
      enable = true;
      ethernet.macAddress = "random";
      wifi = {
        scanRandMacAddress = true;
        macAddress = "random"; # permanent, preserve, random, stable.
      };
    };
  };

  #systemd.services.NetworkManager-wait-online.enable = false; # Fix for ZFS bug.
  #services.dnsmasq.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

}
