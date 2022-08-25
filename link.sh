#!/bin/sh

### =================
## backup initial
### =================

echo "creating backup folders"
# create bak folders
rm -rf ~/.oldconfigs || true
mkdir ~/.oldconfigs || true
mkdir ~/.oldconfigs/.config || true

echo "moving old configs to backup folders"
# move
mv ~/.bashrc ~/.oldconfigs/
mv ~/.npmrc ~/.oldconfigs/
mv ~/.gitignore ~/.oldconfigs/
mv ~/.git-sync-last-run.log ~/.oldconfigs/
mv ~/.profile ~/.oldconfigs/
mv ~/.rebinds ~/.oldconfigs/
mv ~/.selected_editor ~/.oldconfigs/
mv ~/.xbindkeysrc ~/.oldconfigs/
mv ~/.xprofile  ~/.oldconfigs/
mv ~/.zshenv ~/.oldconfigs/
mv ~/.zshrc ~/.oldconfigs/

mv -f ~/.fonts ~/.oldconfigs/

mv -f ~/.config/calibre ~/.oldconfigs/.config/
mv -f ~/.config/coc ~/.oldconfigs/.config/
mv -f ~/.config/flameshot ~/.oldconfigs/.config/
mv -f ~/.config/GIMP ~/.oldconfigs/.config/
mv -f ~/.config/gocode ~/.oldconfigs/.config/
mv -f ~/.config/gtk-2.0 ~/.oldconfigs/.config/
mv -f ~/.config/gtk-3.0 ~/.oldconfigs/.config/
mv -f ~/.config/i3 ~/.oldconfigs/.config/
mv -f ~/.config/i3blocks ~/.oldconfigs/.config/
mv -f ~/.config/kitty ~/.oldconfigs/.config/
mv -f ~/.config/lazygit ~/.oldconfigs/.config/
mv -f ~/.config/neon80sConfigs ~/.oldconfigs/.config/
mv -f ~/.config/nvim ~/.oldconfigs/.config/
mv -f ~/.config/obsidian ~/.oldconfigs/.config/
mv -f ~/.config/picom ~/.oldconfigs/.config/
mv -f ~/.config/systemd ~/.oldconfigs/.config/
mv -f ~/.config/Thunar ~/.oldconfigs/.config/
mv -f ~/.config/transmission ~/.oldconfigs/.config/
mv -f ~/.config/tree-sitter ~/.oldconfigs/.config/

### =================
## link files
### =================

echo "making symlinks"
ln -s "$PWD/.bashrc" ~/
ln -s "$PWD/.npmrc" ~/
ln -s "$PWD/fonts" ~/.fonts
ln -s "$PWD/.gitignore" ~/
ln -s "$PWD/.git-sync-last-run.log" ~/
ln -s "$PWD/.profile" ~/
ln -s "$PWD/.rebinds" ~/
ln -s "$PWD/.selected_editor" ~/
ln -s "$PWD/.xbindkeysrc" ~/
ln -s "$PWD/.xprofile" ~/
ln -s "$PWD/.zshenv" ~/
ln -s "$PWD/.zshrc" ~/

ln -s "$PWD/config/calibre" ~/.config/
ln -s "$PWD/config/coc" ~/.config/
ln -s "$PWD/config/flameshot" ~/.config/
ln -s "$PWD/config/GIMP" ~/.config/
ln -s "$PWD/config/gocode" ~/.config/
ln -s "$PWD/config/gtk-2.0" ~/.config/
ln -s "$PWD/config/gtk-3.0" ~/.config/
ln -s "$PWD/config/i3" ~/.config/
ln -s "$PWD/config/i3blocks" ~/.config/
ln -s "$PWD/config/kitty" ~/.config/
ln -s "$PWD/config/lazygit" ~/.config/
ln -s "$PWD/config/neon80sConfigs" ~/.config/
ln -s "$PWD/config/nvim" ~/.config/
ln -s "$PWD/config/obsidian" ~/.config/
ln -s "$PWD/config/picom" ~/.config/
ln -s "$PWD/config/systemd" ~/.config/
ln -s "$PWD/config/Thunar" ~/.config/
ln -s "$PWD/config/transmission" ~/.config/
ln -s "$PWD/config/tree-sitter" ~/.config/


### =================
## edit permissions
### =================

echo "Making executable"

chmod +x "$PWD/.rebinds"

echo "Finished!"
