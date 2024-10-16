#!/bin/sh

# https://github.com/pyenv/pyenv
sudo apt install \
  make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y

curl https://pyenv.run | bash

if ! grep -F 'export PATH="$HOME/.pyenv/bin:$PATH"' "$HOME/.bashrc"; then
  echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> "$HOME/.bashrc"
  echo 'eval "$(pyenv init --path)"' >> "$HOME/.bashrc"
  echo 'eval "$(pyenv virtualenv-init -)"' >> "$HOME/.bashrc"
  echo '3.9.2' >> "$HOME/.pyenv/version"
  echo 'export PATH="~/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# https://python-poetry.org
curl -sSL https://install.python-poetry.org | python -
poetry config virtualenvs.in-project true
