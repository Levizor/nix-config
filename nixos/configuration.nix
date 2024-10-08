{ config, lib, pkgs, ... }:

  {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
      ./disko-config.nix
      ./user.nix
      <home-manager/nixos>
    ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  

  # boot.extraModulePackages = with config.boot.kernelPackages; [
  #   v4l2loopback
  # ];
  # boot.extraModprobeConfig = ''
  #   options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  # '';
  security.polkit.enable = true;

  #bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  #bluetooth
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  
  security.sudo.extraConfig = ''
    moritz  ALL=(ALL) NOPASSWD: ${pkgs.systemd}/bin/systemctl'';

  services.pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;
  };

  #graphics
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  #nvidia 
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
      open = false;
    
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:2:0:0";
    };
  };


  specialisation = {
    gaming-time.configuration = {
      hardware.nvidia = {
        prime.sync.enable = lib.mkForce true;
        prime.offload = {
          enable = lib.mkForce false;
          enableOffloadCmd = lib.mkForce false;
        };
      };
    };
  };



  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  #sddm
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha";
  };

  boot.plymouth = {
    enable = true;
    theme = "breeze";
  };

  #hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.zsh.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;


  environment.systemPackages = with pkgs; [
     curl
     vim
     git
     brightnessctl
     pulseaudioFull
     pavucontrol 
     clang
     wl-clipboard
     catppuccin-sddm.override{
	flavor = "mocha";
	font = "DejaVu Sans Mono";
	fontSize = "14";
     }
  ];

  


  stylix={
    enable = true;

    polarity = "either";
    image = ./red_winter.jpg;
    targets = {
    	grub.useImage = true;
    };

    opacity = {
	terminal = 0.6;
    };
    fonts = {
      sizes = {
	terminal = 16;
	desktop = 14;
      };

      serif = {
        package = pkgs.dejavu_fonts;
	# package = pkgs.fira-code-symbols;
        name = "DejaVu Serif";
      };

      sansSerif = {
        # package = pkgs.dejavu_fonts;
	package = pkgs.fira-code-symbols;
        name = "DejaVu Sans";
      };

      monospace = {
        # package = pkgs.dejavu_fonts;
	package = pkgs.fira-code-symbols;
        name = "DejaVu Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };



  services.printing.enable = true;
  system.stateVersion = "24.05"; 
}

