echo "updating your system..."
sudo apt update && sudo apt upgrade -y

# install xsel
# https://www.ostechnix.com/how-to-use-pbcopy-and-pbpaste-commands-on-linux/
sudo apt install xsel

# jq
sudo apt install jq

# screeshot recorder
sudo apt install shutter
sudo apt install kazam

sudo apt install neofetch
sudo apt install gnome-tweak-tool

sudo apt install ubuntu-restricted-extras

# pop theme
# https://github.com/pop-os/gtk-theme
# https://github.com/pop-os/icon-theme
sudo add-apt-repository ppa:system76/pop
sudo apt update
sudo apt install pop-theme
sudo apt install pop-icon-theme

# set the theme
gsettings set org.gnome.desktop.interface gtk-theme "Pop"
# set the icon theme
gsettings set org.gnome.desktop.interface icon-theme "Pop"
# or the cursor theme
gsettings set org.gnome.desktop.interface cursor-theme "Pop"

exit 0