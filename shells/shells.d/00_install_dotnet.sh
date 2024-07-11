#!/bin/bash
# Copyright (c) 2024 RFull Development
# This source code is managed under the MIT license. See LICENSE in the project root.

# Register the Microsoft package repository
# See https://learn.microsoft.com/ja-jp/dotnet/core/install/linux-ubuntu#register-the-microsoft-package-repository
ARCH=$(dpkg --print-architecture)
if [[ "$ARCH" != "amd64" ]]; then
    echo ".NET SDK is not available"
    exit 0
fi

source /etc/os-release
wget https://packages.microsoft.com/config/$ID/$VERSION_ID/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Install the .NET SDK
sudo apt update
sudo apt install -y dotnet-sdk-8.0
