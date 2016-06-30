# RUN apt-get update && apt-get install -y wget && wget https://github.com/GCorbel/dotfiles/raw/master/development_docker_install.sh -O - | sh

apt-get update && apt-get install -y \
  software-properties-common \
  build-essential \
  zsh git libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip \
  silversearcher-ag wget

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true && \
  rm -f ~/.zshrc && \
  wget https://raw.githubusercontent.com/GCorbel/dotfiles/master/.zshrc -O ~/.zshrc && \
  sed -i "s/robbyrussell/lukerandall/" ~/.zshrc
  wget https://raw.githubusercontent.com/GCorbel/dotfiles/master/.pryrc -O ~/.pryrc && \

export TERM=xterm-256color
