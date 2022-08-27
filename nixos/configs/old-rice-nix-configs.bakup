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
}
