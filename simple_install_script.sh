# sudo apt-get install wget && wget https://github.com/GCorbel/dotfiles/raw/master/simple_install_script.sh -O - | sudo sh

apt-get update && apt-get install -y \
  software-properties-common \
  build-essential \
  tmux zsh git libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip \
  silversearcher-ag wget

# Install neovim
add-apt-repository ppa:neovim-ppa/unstable && \
  apt-get update && \
  apt-get install -y neovim python-dev python-pip python3-dev python3-pip

update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 && \
  update-alternatives --config vi && \
  update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 && \
  update-alternatives --config vim && \
  update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 && \
  update-alternatives --config editor

cd ~

# Download and link all files
mkdir -p ~/.config && \
  rm .bashrc && \
  git clone https://github.com/GCorbel/dotfiles.git && \
  ln -s ~/dotfiles/.vim ~/.config/nvim && \
  ln -s ~/dotfiles/.vimrc_simple ~/.config/nvim/init.vim && \
  ln -s ~/dotfiles/.tmux.conf . && \
  ln -s ~/dotfiles/.zshrc . && \
  ln -s ~/dotfiles/.bashrc . && \
  ln -s ~/dotfiles/.pryrc .

rm -r ~/.config/nvim/bundle/Vundle.vim && \
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim && \
  nvim -c 'BundleInstall' -c 'qa!'

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true && \
  chsh -s $(which zsh) && \
  sed -i "s/robbyrussell/lukerandall/" ~/.zshrc

export TERM=xterm-256color
