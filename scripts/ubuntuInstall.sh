#!/bin/sh
set -x
# Installation
# sudo apt update
# sudo apt upgrade

programs=""

checkExist() {
  if ! command -v $1
  then
    programs="${programs} $1"
    echo "Command not found"
  fi
}

runBasic() {
  checkExist "curl"
  checkExist "git"
  checkExist "tmux"
  checkExist "ranger"

  if [ -z "$programs" ]
  then
    echo "No programs to install"
  else
    echo "Install programs $programs"
    sudo apt -y install $programs
  fi
}

installNeovim() {
  # Neovim 0.8
  curl -L https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb > nvim-linux64.deb
  sudo apt install ./nvim-linux64.deb


  # VimPlug
  # sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  #        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  # Backup old config
  mv ~/.config/nvim ~/.config/nvim.bak
  mv ~/.local/share/nvim ~/.local/share/nvim.bak

  # Install astrovim
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
}

runRanger() {
  git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
}

runZsh() {
  sudo apt -y install zsh
  ## oh-my-zsh
  chsh -s $(which zsh)
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.config/oh-my-zsh}/plugins/zsh-autosuggestions
}

installKitty() {
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

  # Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
  # your system-wide PATH)
  ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
  # Place the kitty.desktop file somewhere it can be found by the OS
  cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
  # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
  cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
  # Update the paths to the kitty and its icon in the kitty.desktop file(s)
  sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
  sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
}

installEmacs() {
  sudo add-apt-repository ppa:kelleyk/emacs
  sudo apt-get update
  sudo apt-get -y install emacs28
  git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
  ~/.config/emacs/bin/doom install
}

installi3() {
  echo 'Run Desktop'
  # i3, nitrogen and rofi
  # sudo apt -y install dconf-editor
  sudo apt -y install i3 nitrogen rofi
}

runDotfiles() {
  # Dotfiles
  rm -rf .zshrc
  echo ".dotfiles" >> $HOME/.gitignore
  git clone --bare https://github.com/RafaelB97/dotfiles.git $HOME/.dotfiles
  /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout --force
  /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no
}

# runBasic
# runDotfiles
# installNeovim
# runRanger
# runZsh

# installKitty
# installEmacs
# installi3

# # Font
# Download from NerdFont, in this case FiraCode Font
