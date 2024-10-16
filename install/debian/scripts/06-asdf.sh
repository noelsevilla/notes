#!/bin/sh

git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch "$ASDF_VERSION"

if ! grep -F "asdf.sh" "$HOME/.bashrc"; then
  echo "# asdf config start" >> "$HOME/.bashrc"
  echo 'export ASDF_SET="true"' >> "$HOME/.bashrc"
  echo ". $HOME/.asdf/asdf.sh" >> "$HOME/.bashrc"
  echo ". $HOME/.asdf/completions/asdf.bash" >> "$HOME/.bashrc"
  echo "lua $LUA_VERSION" >> "$HOME/.tool-versions"
  echo "# asdf config end" >> "$HOME/.bashrc"
fi

. "$HOME/.asdf/asdf.sh"

# Go plugin
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf install golang "$GO_VERSION"
asdf global golang "$GO_VERSION"


# Lua plugin
asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git
asdf install lua "$LUA_VERSION"
asdf global lua "$LUA_VERSION"
