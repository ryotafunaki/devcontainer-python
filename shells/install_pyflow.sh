#!/bin/bash
ARCH=$(dpkg --print-architecture)

if [[ "$ARCH" == "arm64" ]]; then
    echo "pyflow is not available for arm64"
    exit 0
fi

wget https://github.com/David-OConnor/pyflow/releases/download/0.3.1/pyflow_0.3.1_amd64.deb
sudo dpkg -i pyflow_0.3.1_amd64.deb
rm pyflow_0.3.1_amd64.deb