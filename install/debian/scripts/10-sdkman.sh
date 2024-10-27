#!/bin/sh

# https://sdkman.io

sudo apt install zip unzip -y
curl -s "https://get.sdkman.io" | bash

. "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java "$JDK_VERSION"
sdk install gradle "$GRADLE_VERSION"
sdk install kotlin "$KOTLIN_VERSION"
