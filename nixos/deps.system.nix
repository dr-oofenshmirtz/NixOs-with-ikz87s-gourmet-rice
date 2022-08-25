# Dependencies for the root user
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    pkgs.gh
    pkgs.git
    pkgs.neovim
    pkgs.nix-direnv
    pkgs.nmap
    pkgs.nodejs
    pkgs.rust-analyzer
    pkgs.rustup
    pkgs.rustc
    pkgs.rustfmt
    pkgs.cargo
    pkgs.unar
    pkgs.zsh 
  ];
}
