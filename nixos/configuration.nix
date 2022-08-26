{ config, pkgs, lib, ... }:

{
  imports = 
  [
    ./configs
  ];


  system.stateVersion = "22.05";
}
