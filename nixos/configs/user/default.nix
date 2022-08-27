{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yikers = {
    isNormalUser = true;
    description = "yikers";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "yikers";
  services.xserver.displayManager.defaultSession = "none+bspwm";
}
