# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";

    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
    #desktopManager.kitty.enable = true;


    windowManager = {
      bspwm = {
        enable = true;
	configFile = "/home/yikers/.config/bspwm/bspwmrc";
	sxhkd.configFile = "/home/yikers/.config/bspwm/sxhkdrc";
      };
    };
  };

  programs.nm-applet.enable = true;
  services.blueman.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yikers = {
    isNormalUser = true;
    description = "yikers";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      kate
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "yikers";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.


    # probably don't need but here for ref
    # pkgs.blueman-applet
    # pkgs.pa-applet this is a different config block
    # pkgs.nm-applet


    #rice
    pkgs.acpi
    #pkgs.amixer might be alsamixer
    pkgs.alttab #
    pkgs.blueman #
    pkgs.brave
    pkgs.bspwm
    #pkgs.bspswallow
    pkgs.gnomeExtensions.cairo-clock  
    pkgs.colorpicker
    pkgs.dbus
    pkgs.dbus.daemon
    #pkgs.discover-overlay
    pkgs.discord 
    pkgs.eww
    pkgs.flameshot
    #pkgs.gdbus possible dbus-glib possible already in dbus
    pkgs.hsetroot
    pkgs.i3lock
    pkgs.i3blocks #
    pkgs.kitty
    pkgs.looking-glass-client #
    pkgs.gnome.nautilus
    pkgs.nautilus-open-any-terminal
    #pkgs.mantablockscreen gonna have to github install
    pkgs.mpv
    pkgs.paper-icon-theme #
    # pkgs.pacmd probably a pulse setting
    # pkgs.pactl
    pkgs.pavucontrol
    pkgs.picom
    pkgs.playerctl
    pkgs.polybar
    pkgs.polkit_gnome
    pkgs.pqiv
    pkgs.pulseaudio
    pkgs.pulseaudio-ctl
    pkgs.python3Full
    pkgs.pywal #
    pkgs.rofi
    pkgs.scrot
    pkgs.spicetify-cli
    pkgs.spotify
    pkgs.sxhkd
    pkgs.sysstat # for mpstat
    pkgs.vlc #
    pkgs.xclip
    pkgs.xdg-desktop-portal-gnome
    pkgs.xdotool
    pkgs.xfce.thunar
    pkgs.xorg.setxkbmap
    pkgs.xprintidle
    pkgs.xorg.xwininfo
    pkgs.wmctrl
    pkgs.wpgtk
    pkgs.yad

    #personal
    pkgs.calibre
    pkgs.discord
    pkgs.electrum
    pkgs.filezilla
    pkgs.gh
    pkgs.gimp
    pkgs.git
    pkgs.gitkraken
    pkgs.kitty
    pkgs.monero-gui
    pkgs.neovim
    pkgs.nix-direnv
    pkgs.nmap
    pkgs.nodejs
    pkgs.obsidian
    pkgs.rust-analyzer
    pkgs.rustup
    pkgs.rustc
    pkgs.rustfmt
    pkgs.cargo
    pkgs.spotifyd
    pkgs.unar
    pkgs.qbittorrent
    pkgs.zsh 
  ];
 
  # Overwrites	
  nixpkgs.overlays = [
  (self: super: {
    picom = super.picom.overrideAttrs (old: {
      version = "git"; # usually harmless to omit
      src = pkgs.fetchFromGitHub {
        owner = "pijulius";
        repo = "picom";
        rev = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
        sha256 = "sha256-YiuLScDV9UfgI1MiYRtjgRkJ0VuA1TExATA2nJSJMhM=";
      };
    });
  })
];

  
  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME    = "\${HOME}/.local/bin";
    XDG_DATA_HOME   = "\${HOME}/.local/share";

    PATH = [ 
      "\${XDG_BIN_HOME}"
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
	
  programs.neovim.enable = true;
  programs.neovim.viAlias = true;

  programs.dconf.enable = true;



	
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
