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
  mkdir -p ~/.local/bin
  # sudo apt -y install vim-gtk3 

  checkExist "gcc"
  checkExist "curl"
  checkExist "git"
  checkExist "vim"
  checkExist "tmux"

  if [ -z "$programs" ]
  then
    echo "No programs to install"
  else
    echo "Install programs $programs"
    sudo apt -y install $programs
  fi
}

runNeovim() {
  # Neovim 0.8
  curl -L https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb > nvim-linux64.deb
  sudo apt install ./nvim-linux64.deb

  # Lunarvim
  # curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh

  # VimPlug
  # sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  #        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

runRanger() {
  # Ranger
  sudo apt -y install ranger
  git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
}

installRuby() {
  # rbenv and Ruby
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  cd ~/.rbenv && src/configure && make -C src
  ~/.rbenv/bin/rbenv init

  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
  rbenv install -l
}

runTmuxinator() {
  echo "runTmuxinator"
  # installRuby
  # rbenv install 3.0.2
  # rbenv global 3.0.2

  # tmuxinator
  # gem install tmuxinator
}

installRust() {
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source $HOME/.cargo/env
}

installAlacritty() {
  installRust

  # sudo apt-get -y install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
  sudo apt-get -y install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

  git clone https://github.com/alacritty/alacritty.git $HOME/.alacritty
  cd $HOME/.alacritty
  cargo build --release

  ### Config alacritty
  sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

  sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
  sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
  sudo desktop-file-install extra/linux/Alacritty.desktop
  sudo update-desktop-database


  mkdir -p /usr/local/share/man/man1
  gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
  cd ~
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

installi3() {
  echo 'Run Desktop'
  # i3, nitrogen and rofi
  # sudo apt -y install dconf-editor
  sudo apt -y install i3 nitrogen rofi
}

runZsh() {
  sudo apt -y install zsh
  ## oh-my-zsh
  chsh -s $(which zsh)
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.config/oh-my-zsh}/plugins/zsh-autosuggestions
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
# runNeovim
# runRanger
# runZsh
# installKitty

# runTmuxinator

# # Font
# Download from NerdFont, in this case FiraCode Font
