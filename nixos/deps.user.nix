{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #personal
    pkgs.calibre
    pkgs.discord
    pkgs.electrum
    pkgs.filezilla
    pkgs.gimp
    pkgs.gitkraken
    pkgs.kitty
    pkgs.monero-gui
    pkgs.obsidian
    pkgs.qbittorrent
    pkgs.ytfzf
  ];
}
