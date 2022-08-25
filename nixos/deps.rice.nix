# Configs for the rice

{ config, pkgs, ... } :

{
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

  environment.systemPackages = with pkgs; [
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
}
