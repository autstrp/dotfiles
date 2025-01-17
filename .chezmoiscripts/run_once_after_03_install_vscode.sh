#!/usr/bin/env zsh

set -euxo pipefail

# https://code.visualstudio.com/docs/setup/linux

_install_vscode() {
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |
        sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
    rm -f packages.microsoft.gpg
    sudo apt install apt-transport-https
    sudo apt-get update -y
    sudo apt-get install -y code
}

if ! type code >/dev/null 2>&1; then
    _install_vscode
fi
