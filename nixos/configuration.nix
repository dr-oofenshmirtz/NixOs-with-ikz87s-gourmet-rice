{ config, pkgs, ... }:

{
  imports = 
  [
    /etc/nixos/hardware-configuration.nix
    ./deps.system.nix
    ./deps.rice.nix
    ./deps.user.nix
    ./userconf.nix
    ./systemconf.nix
    ./vars.nix
  ];

  system.stateVersion = "22.05";
}
