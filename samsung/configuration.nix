# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
#  networking.extraHosts = ''
#	192.168.0.101 vcenter01.gregoryroche.lan       # Example
#	'';
  networking.hosts = {
        "192.168.0.22" = [
                "storagedocker"
                ];
	"192.168.0.101" = [
		"vcenter01.gregoryroche.lan"
		];
        "192.168.0.230" = [
                "esxir610.gregoryroche.lan"
                ];
        "192.168.0.226" = [
                "storage1"
                ];
        "192.168.0.228" = [
                "storage2"
                ];
        "192.168.0.48" = [
                "storage3"
                ];
        };
  
#  fileSystems."/home/greg/nfs" = {
#        device = "storagedocker:/home/greg/docker";
#        fsType = "nfs";
#        options = [
#		"x-systemd.automount"
#		"noauto" # Mount on demande
#		"x-systemd.idle-timeout=600" # Auto-disconnecting
#		];
#        };

#  fileSystems."/mnt/media/storage01" = {
#        device = "//192.168.0.226/";
#        fsType = "cifs";
#        options = [
#                "x-systemd.automount"
#                "noauto"
#		"username=admin"
#                "password=changeme"
#                ];
#        };
#  fileSystems."/mnt/media/storage02" = {
#        device = "//192.168.0.228/";
#        fsType = "cifs";
#        options = [
#	        "x-systemd.automount"
#                "noauto"
#                "username=admin"
#                "password=changeme"
#                ];
#        };
#  fileSystems."/mnt/media/storage03" = {
#        device = "//192.168.0.46/media";
#        fsType = "cifs";
#        options = [
#                "x-systemd.automount"
#                "noauto"
#                "username=administrator"
#                "password=changeme"
#                ];
#        };

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_FR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Cinnamon Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "latin9_nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.greg = {
    isNormalUser = true;
    description = "greg";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "greg";
#  services.xserver.displayManager.autoLogin.enable = true;
#  services.xserver.displayManager.autoLogin.user = "greg";

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #nixpkgs.config = {
  #  allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "vscode-1.97.2" ];
  #};

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    vlc
    winbox4
    vscode
    git
    powershell
    google-chrome
    ventoy-full
    rpi-imager
    terminator
    filezilla
    putty
    freerdp
    keepass
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-1.1.05"
  ];

#  virtualisation.docker.enable = true;
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
