#!/bin/sh

echo "Installing git"
sudo apt install git -y

if ! grep -F "pager = delta" "$HOME/.gitconfig"; then
  cd "$HOME" || exit
  git config --global --add core.pager delta && \
  git config --global --add interactive.diffFilter 'delta --color-only' && \
  git config --global --add delta.navigate true && \
  git config --global --add delta.dark true && \
  git config --global --add delta.line-numbers true && \
  git config --global --add delta.syntax-theme 'Visual Studio Dark+' && \
  git config --global --add delta.file-decoration-style cyan && \
  git config --global --add delta.file-style cyan && \
  git config --global --add delta.inline-hint-styles cyan && \
  git config --global --add delta.tabs 4 && \
  git config --global --add delta.line-numbers-left-style cyan && \
  git config --global --add delta.line-numbers-right-style cyan && \
  git config --global --add delta.line-numbers-minus-style deeppink && \
  git config --global --add delta.line-numbers-plus-style lime && \
  git config --global --add delta.line-numbers-zero-style dimgrey && \
  git config --global --add delta.hunk-header-line-number-style cyan && \
  git config --global --add delta.hunk-header-file-style cyan && \
  git config --global --add delta.hunk-header-decoration-syle 'cyan box'
fi

# https://github.com/dandavison/delta
echo "Installing git delta"
wget https://github.com/dandavison/delta/releases/download/0.16.5/git-delta_0.16.5_amd64.deb -P "$HOME" && \
  sudo dpkg -i ~/git-delta_0.16.5_amd64.deb
