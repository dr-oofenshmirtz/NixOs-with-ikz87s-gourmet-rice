# Dependencies for the root user
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    pkgs.cargo
    pkgs.fzf
    pkgs.fzf-zsh
    pkgs.gh
    pkgs.git
    pkgs.neovim
    pkgs.nix-direnv
    pkgs.nmap
    pkgs.nodejs
    pkgs.oh-my-zsh
    pkgs.rust-analyzer
    pkgs.rustc
    pkgs.rustfmt
    pkgs.unar
    pkgs.zsh 
  ];
}
