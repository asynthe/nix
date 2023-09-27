{
  config,
  pkgs,
  username,
  ...
}: {
  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  # Add user to libvirtd group
  users.users.${username}.extraGroups = ["libvirtd"];

  # VirtualBox
  virtualisation.virtualbox = {
    # Host Configuration
    host = {
      enable = true;
      #headless = ;
      #enableWebService = ;
      enableExtensionPack = true; # Required to forward usb2/usb3 to guests. Requires nixpks.config.allowUnfree = true
      #addNetworkInterface = ; # Sets up vboxnet0
    };
    # Guest Additions, both need to be enabled.
    guest = {
      enable = true;
      x11 = true;
    };
  };

  users.extraGroups.vboxusers.members = ["${username}"];

  # Install necessary packages
  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      virt-manager
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      win-virtio
      win-spice
      xorriso
      libguestfs
      ;
    inherit (pkgs.gnome) adwaita-icon-theme; # Needed if not running gnome.
  };

  # Manage the virtualization services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;

  # Run KVM Hypervisors inside KVM Hypervisors
  boot.extraModprobeConfig = "options kvm_intel nested=1";
}
