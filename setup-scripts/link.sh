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
mv ~/.bashrc ~/.oldconfigs/ || true
mv ~/.npmrc ~/.oldconfigs/ || true
mv ~/.gitignore ~/.oldconfigs/ || true
mv ~/.git-sync-last-run.log ~/.oldconfigs/ || true
mv ~/.profile ~/.oldconfigs/ || true
mv ~/.rebinds ~/.oldconfigs/ || true
mv ~/.selected_editor ~/.oldconfigs/ || true
mv ~/.xbindkeysrc ~/.oldconfigs/ || true
mv ~/.xprofile  ~/.oldconfigs/ || true
mv ~/.zshenv ~/.oldconfigs/ || true
mv ~/.zshrc ~/.oldconfigs/ || true

mv -f ~/.fonts ~/.oldconfigs/ || true

mv -f ~/.config/calibre ~/.oldconfigs/.config/ || true
mv -f ~/.config/coc ~/.oldconfigs/.config/ || true
mv -f ~/.config/flameshot ~/.oldconfigs/.config/ || true
mv -f ~/.config/GIMP ~/.oldconfigs/.config/ || true
mv -f ~/.config/gocode ~/.oldconfigs/.config/ || true
mv -f ~/.config/gtk-2.0 ~/.oldconfigs/.config/ || true
mv -f ~/.config/gtk-3.0 ~/.oldconfigs/.config/ || true
mv -f ~/.config/i3 ~/.oldconfigs/.config/ || true
mv -f ~/.config/i3blocks ~/.oldconfigs/.config/ || true
mv -f ~/.config/kitty ~/.oldconfigs/.config/ || true
mv -f ~/.config/lazygit ~/.oldconfigs/.config/ || true
mv -f ~/.config/neon80sConfigs ~/.oldconfigs/.config/ || true
mv -f ~/.config/nvim ~/.oldconfigs/.config/ || true
mv -f ~/.config/obsidian ~/.oldconfigs/.config/ || true
mv -f ~/.config/picom ~/.oldconfigs/.config/ || true
mv -f ~/.config/systemd ~/.oldconfigs/.config/ || true
mv -f ~/.config/Thunar ~/.oldconfigs/.config/ || true
mv -f ~/.config/transmission ~/.oldconfigs/.config/ || true
mv -f ~/.config/tree-sitter ~/.oldconfigs/.config/ || true

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
