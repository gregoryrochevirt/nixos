# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master")
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "swarm02"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set static IP
  networking.interfaces.ens32.ipv4.addresses = [ {
    address = "192.168.0.20";
    prefixLength = 24;
  } ];
  networking.defaultGateway = "192.168.0.254";
  networking.nameservers = [ "192.168.0.254" ];

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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "latin9_nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.greg = {
    isNormalUser = true;
    description = "greg";
    extraGroups = [ "networkmanager" "wheel" "docker" "podman" ];
    packages = with pkgs; [];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQChTTBLa69Zc3CUFzqEATmh5uU4r9XUn9mWbMB/6OHXQjOJYao2tNaVP+2teEpdF1lf3RaUO1DDeUZ7tcrxCf1Pzcb1ff71nw8JDkN4vvLBlflieFXo8KXHtB2hmlFYG1TOn0mdNSxdIPcmdmWvD092LE/qtwrq+Cbj4gZpIE9pYA22i4zULuopuLeraZfsCXQAQ10kI9A/a/rYgxkktW/8BN2BrH1M5eatyytWRoqq5ICcPc4M+w4q+MwjJjFAx0ivwPcaV5IbwV1+bzfHzSEats2NolJEzCNaqqgJlpxfkrTyv0xTVl19aNupKY8Fjchyr30Io3lJyOMMJLDcLxihmxx48PAtRxbxTB7l1B4qnfIRZmdPzyoO3oFMesoLwtpgwfMi4h1XHciX9SnwU52cyJw9Gd7V/nME0NQO8npDAx28jRNq8bbkFZM1ssOjQVc93Lyw/bEoWqtY5rm1U8QDT+hDDYdeFccb3k+YHGo9rs7ZJreB/vXyT1lP0WYcKZGs7q2OqS289Wo7VWW/aOKVE2Cz1H6VAU2+c1hyYhf6fc21t5GPxzcr5Z8nLS48dqQqw5+3kbAkzvN5wHzUi/qbaBPpqI0cfLK7VDtHKhaVriu75gpvhi+b56oPKoRyOxHpIWaV4hotA9mxOSH0Bzg79dyyiRDxW6HiyygJwQhajQ== gregoryroche\administrator@workstation1"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDkzXuKd9Eu7DL1vy8q6SWTIT39zLZr0pzeOgr3ulH0Nm43tATPvQb2XhthwI6NYUkob7vzfv6+29hjAe6R/eBbjctEiU563G3IT7d3VYK/N3effAd9yv5MbObBuFi5aFh4SegVIIAoyjA3/yQgy+nSyhGh0rizhOJinoFBR2KDg6xK3FKsatF9Fw8+NddOAlXhOWfzK4Zsjun+/LCSeqdEarlxDlCAPz/VX/fPpm4+YrpcSqyKLBlfZ2WZ02jlN//Sx3GRiBpRT4xLCjEDSDOaHQMh1hQuRwTjt7MxgMVKYQnlgxVcw5lGqODL3tzp5TkpLVsH48fD/PXkL7mcoZRsp/psN60gyHhY4tVXxeIPmoX4+96pnucg677xDLKf74NOQ9olKMLYTEZTjFdkVpGlHEPgsUyRXlqfyMU9j7vvGhdPuKt7bp0Xj446cTqyfraf5XXTarahCTrFoUky5JunSThxYW7ApmTtt2TeOx7M3L3p+R5OdQj/toRLFsKLIpc5xTnQSc1POywKpTwHfjNkOKaxSsxPW2gv4qHVPjGLvEB4vrWAVGAELGKmE1Az/YnZZYPZSyzLnz4bSf9D/5i4zAiE4p2/97N3Y1e4IPd6srxCcQdjPbynGpJBLrVPCsK4kIcEOG8d+HshQ1kRwuoeiEhTXeSWdanvfuuprtUbpQ== greg@portable"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCk5zTxY7HLg4Dhgbic795mt9BPgm3gEeftQWLC95+4eDNks+m5EFB962IHD/2p+CwZbhhBkwhGS/Yin+iiWskolEodTbBZrJw3F5r5+lr8LLhyWIBLkx6TI4MLYZwpDOLLGyCq9Ed3XDWbvNtPXdmmGBPxBItV6YldbFSCCoGNd0bDOKKw9Z8AxIOfBshNt95Z9PnTeuP3zuOTZ+Byq7Z+hLpjjbHaJMbswaKMU/BDhA3MRZ1ybj18pwUnN2LCExVO4fpU1H/rVfLjlXej1gvP/8lWn1zaGnMvjZVLta4du0LtvjtSFHB5LAFMgTLrc7n0b8eai+gYzQZyUDxodpeqBYm0bk2rgYPAOv7/7WWio/0j5spLqJDL+vlyTAIvKRzLuJNwkrVqG7Bmfavzgv5VzDSC4wEBt2HIg43xumCRzcvJUKIrsgMsrcFv0VGqvMBGsUmx0boEAOMfkk1bP2S0CmOAUwBqFmtrh1I/DWXzuz+gcWa+9nHAsZxQSgCZxO8v+TR5EOMSF4UTSUrDvYvh4BUqsestxJG35IMJ4y7LpDBmMIHm+HKyF54bo6pkyCZQIhXdSumlAREXfXsPq1k+OILEgKNgYrb6iaCH2pFhmMJyMk1yKzHZfCX9Ag9ycSpfOm/edvqxajopkmfVWDZUSedpe6RvEEq9d00dqY4/kw== greg@kasm01"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDB3pRXKVcwPsNqmuxu8FwveJltHnodoTx/l/WgqcF4BeEAxXvRWfMvrxlvRjkMWAqDanO4sTZvOvjuDCa6Ep/h/UH0/u3gbKPzz73ynOX1fnH+VaMMo55Vfgiw6SSzN66Ktjut0WFzIyDmWnRJV/Sth/XDSUURzFIdX57NWt60gfdILo5ZpHSo6UxJaFwmhJuu2e/Nkw9Y3/qFvx3XOHYpKI1G+rxlPB7Kb+6xxjkm4GK8ACY57il8f407S/zUf3XqYiuY1qbpzIEGGRIw6oOgjtXrgwAyMIHD//koW9f/hzhSygnve9WHshXfhq3t3ZlDQKiOKos+/xnpM0ty4X7NZHZW57Mdp7vdKmQg/+HGQNutFe6hf2WS7NyJZp9MTm5yd+ojKR5jHzOrGha+ddtvfxtCQIZiZJ9mcsIU7txXL2dbA34WiuzceD73ltINWVFQyvlO7kJBiLAUfBnn4tfiFZD+6syHvGUK3TOSX5MwR+/hGrLFylZVeWFkxSRsOP/79vyJ+OVxCo4FyKpwAw5W/N2v7JRrtqQD89a3zZ/MAGL7u/uGJETHd+nZd+gZKFZJk9eyTouj+s4FU43SeOcfBxS+mfR9HVTKfSXraWlfuctlBlcdi4NkFa/Ax1GKJgYMMqHuaV0/gKRiWAftRnADSCKVrf6EVgpmttj7fkvsCQ== kasm-user@af32dadd06fa"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCwIE7A5FPmSQHCrGknQmZ0ADwdiEUzsSTi4vaQFnGDwW8co/yM/ftuiZIsy++oWzB6kNrmJ+uFfw+VmN1hw6FKjFvBp9x5MdYj5/lS9J3rLHRfgfqOxfoPneWJXxGekcelJpsWCwSxr8sUCDYMjcWksSFfPsD0tiMhaGPOPWwGGhnguwtIm9wnWc9d+VbmoexQT6nm9KocAh6sslkS8HwOjgquwLk3Ckn87FSsZrjuK2NAW4bKW/jTrEk/FldnOJw7+dFtRZjfQERcQxWy47Xj+nhrY4EqnH4cozzcYOYI4oY4FOk7cegucmQxyvTcSY0uauyNut/RHR9TqPkyBh0CdPo9RVOtf6/7jnakpgW4boNweRwwlD7o9JL6jG/62XlQN5fPLiBPeA5zKmluJiAvXVLshvYa1+qEOuMd+irvVzWHZQBYs1weHweXCJavjAMFIhmv8F+CP5TDADs7ZcQoqkv3l5hjH5CeSc2bqv+cWSFBZb8lrT4kkfy2rJiUFAWM2NBk3uUf9hsuHw3eeRvJ0DCT7IPcOsiHIvJkr+V2aCfl1PpaKuPbJeWirTdUl3/b54xJNm5yV8Z56EMg5QtFlqNnwEzI2s2GJXGLt49pIrcqofJRJgl6sK55/pF4jDKXiA+t8Mx05a0Ad87Rzvrm9pr2FOna1wdH95bRCA4+RQ== greg@storagedocker"
      # content of authorized_keys file
      # note: ssh-copy-id will add user@your-machine after the public key
      # but we can remove the "@your-machine" part
    ];
    openssh.authorizedKeys.keyFiles = [
      /home/greg/.ssh/authorized_keys
    ];
  };

  users.users.coder = {
    isNormalUser = true;
    description = "coder";
    extraGroups = [ "networkmanager" "wheel" "docker" "podman" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #wget
  docker-compose
  git
  #vscodium
  vscode 
  #zsh
  #zsh-powerlevel10k
  #meslo-lgs-nf
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable VMware tools
  virtualisation.vmware.guest.enable = true;

  # Enable vscode-server
  services.vscode-server = {
    enable = true;
#    enableFHS= true;
  };

  # Enable docker
  virtualisation.docker = {
    enable = true;
    storageDriver = "overlay2";
    autoPrune = {
      enable = true;
      dates = "daily";
    };
  };

  # Enable Rootless docker
  #virtualisation.docker.rootless = {
  #  enable = true;
  #  setSocketVariable = true;
  #};

  # Enable podman
  # Enable common container config files in /etc/containers
#  virtualisation.containers.enable = true;
#  virtualisation = {
#    podman = {
#      enable = true;
#      # Create a `docker` alias for podman, to use it as a drop-in replacement
#      dockerCompat = true;
#      # Required for containers under podman-compose to be able to talk to each other.
#      defaultNetwork.settings.dns_enabled = true;
#    };
#  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 443 222 22 6767 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Set nfs mount
  networking.hosts = {
    "192.168.0.22" = [
       "storagedocker"
    ];
  };
  fileSystems."/nfs/docker" = {
    device = "storagedocker:/home/greg/docker";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11";
}
