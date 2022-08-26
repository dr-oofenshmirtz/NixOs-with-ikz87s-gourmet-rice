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
mv -f ~/.config/GIMP ~/.oldconfigs/.config/ || true
mv -f ~/.config/lazygit ~/.oldconfigs/.config/ || true
mv -f ~/.config/nvim ~/.oldconfigs/.config/ || true
mv -f ~/.config/obsidian ~/.oldconfigs/.config/ || true
mv -f ~/.config/transmission ~/.oldconfigs/.config/ || true
mv -f ~/.config/tree-sitter ~/.oldconfigs/.config/ || true

### =================
## link files
### =================

echo "making symlinks"
ln -s "$PWD/config/.bashrc" ~/
ln -s "$PWD/config/.npmrc" ~/
ln -s "$PWD/fonts" ~/.fonts
ln -s "$PWD/config/.profile" ~/
ln -s "$PWD/config/.rebinds" ~/
ln -s "$PWD/config/.selected_editor" ~/
ln -s "$PWD/config/.xbindkeysrc" ~/
ln -s "$PWD/config/.xprofile" ~/
ln -s "$PWD/config/.zshenv" ~/
ln -s "$PWD/config/.zshrc" ~/

ln -s "$PWD/config/calibre" ~/.config/
ln -s "$PWD/config/coc" ~/.config/
ln -s "$PWD/config/GIMP" ~/.config/
ln -s "$PWD/config/lazygit" ~/.config/
ln -s "$PWD/config/nvim" ~/.config/
ln -s "$PWD/config/obsidian" ~/.config/
ln -s "$PWD/config/transmission" ~/.config/
ln -s "$PWD/config/tree-sitter" ~/.config/


### =================
## edit permissions
### =================

echo "Making executable"

chmod +x "$PWD/config/.rebinds"

echo "Finished!"
