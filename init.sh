#Get things to the latest build
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo add-apt-repository multiverse
sudo add-apt-repository ppa:apt-fast/stable
sudo apt -y install apt-fast
sudo apt-fast update
sudo apt-fast upgrade
sudo apt-fast dist-upgrade

#Personalized Applications Download
sudo apt-fast install git unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip yadm neovim neovim-qt vim-gtk3 rsync rclone snapd flatpak qbittorrent flameshot wine-stable steam ubuntu-restricted-extras libavcodec-extra gnome-tweaks vlc blender 
sudo ubuntu-drivers autoinstall
sudo apt-fast install nvidia-driver-525

# install the "whiptail" package if it's not already installed
if ! dpkg -s whiptail >/dev/null 2>&1; then
    sudo apt-fast install -y whiptail
fi

#Personalized System Utils 

#present the user with a choice between two commands using "whiptail"
CHOICE=$(whiptail --title "Choose an action" --menu "Choose one of the following options:" 12 60 2 \
    "1" "Install ZSH" \
    "2" "Install FISH" 3>&1 1>&2 2>&3)

# execute the chosen command based on the user's selection
case $CHOICE in
    1)
        echo "Installing and Configuring ZSH"
        curl -L git.io/antigen > ~/antigen.zsh
        antigen update
        #Config Dotfiles
        #yadm clone https://github.com/jazzhpatel/.dotfiles.git
        sudo chsh -s /bin/zsh 
        zsh
        ;;
    2)
        echo "Installing and Configuring FISH"
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        curl -L https://get.oh-my.fish > install && fish install --path=~/.local/share/omf --config=~/.config/omf
        #yadm clone https://github.com/jazzhpatel/.dotfiles.git
        chsh -s /usr/local/bin/fish
        fish
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

#Config Personalized Vim
vim -E -c PlugInstall -c q

#--- Personal Utils Config: ---

#Install python and thefuck
sudo apt-fast install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck

# install pip essentials
pip3 install pip-review
