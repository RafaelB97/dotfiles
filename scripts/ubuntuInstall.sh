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
  checkExist "stow"

  if [ -z "$programs" ]
  then
    echo "No programs to install"
  else
    echo "Install programs $programs"
    sudo apt -y install $programs
  fi
}

installNeovim() {
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt-get update
  sudo apt-get install neovim

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

  ## auto-suggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.config/oh-my-zsh}/plugins/zsh-autosuggestions

  ## syntax-highlitghting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.config/oh-my-zsh}/plugins/zsh-syntax-highlighting
}

installKitty() {
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

  # Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
  # your system-wide PATH)
  mkdir -p $HOME/.local/bin
  ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
  # Place the kitty.desktop file somewhere it can be found by the OS
  cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
  # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
  cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
  # Update the paths to the kitty and its icon in the kitty.desktop file(s)
  sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
  sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
}

installEmacs() {
  sudo apt -y install ripgrep fd-find
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

runStow() {
  # Dotfiles
  rm -rf .zshrc
  git https://github.com/RafaelB97/dotfiles.git $HOME/.dotfiles
  cd $HOME/.dotfiles
  stow .
  cd $HOME
}

installNerdfonts() {
  git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
  cd nerd-fonts
  git sparse-checkout add patched-fonts/FiraCode
  ./install.sh FiraCode
}

# runBasic
# runDotfiles
# installNeovim
# runRanger
# runZsh

# installNerdfonts
# installKitty
# installEmacs
# installi3

# # Font
# Download from NerdFont, in this case FiraCode Font
