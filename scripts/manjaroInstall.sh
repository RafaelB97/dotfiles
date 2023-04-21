#!/bin/sh
set -x

programs=""

checkExist() {
  if ! command -v $1
  then
    programs="${programs} $1"
    echo "Command not found"
  fi
}

runBasic() {
  checkExist "gcc"
  checkExist "curl"
  checkExist "git"
  checkExist "neovim"
  checkExist "tmux"
  checkExist "ranger"

  if [ -z "$programs" ]
  then
    echo "No programs to install"
  else
    echo "Install programs $programs"
    sudo pacman -S $programs
  fi
}

installNeovim() {
  # Backup old config
  mv ~/.config/nvim ~/.config/nvim.bak
  mv ~/.local/share/nvim ~/.local/share/nvim.bak

  # Install astrovim
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
}

installRanger() {
  git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
}

runZsh() {
  ## oh-my-zsh
  chsh -s $(which zsh)
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.config/oh-my-zsh}/plugins/zsh-autosuggestions
}

installKitty() {
  sudo pacman -S kitty
}

installEmacs() {
  sudo pacman -S emacs
  git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
  ~/.config/emacs/bin/doom install
}

installi3() {
  echo 'Run Desktop'
  # i3, nitrogen and rofi
  sudo pacman -S i3-gaps nitrogen dmenu i3status wmctrl
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
# installRanger
# runZsh

# installKitty
# installEmacs
# installi3

# # Font
# Download from NerdFont, in this case FiraCode Font
