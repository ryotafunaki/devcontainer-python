#!/bin/bash
# Copyright (c) 2024 RFull Development
# This source code is managed under the MIT license. See LICENSE in the project root.

# Install pyflow
# See https://pypi.org/project/pyflow/
ARCH=$(dpkg --print-architecture)
if [[ "$ARCH" != "amd64" ]]; then
    echo "pyflow is not available"
    exit 0
fi

PACKAGE_VERSION=0.3.1
PACKAGE_FILE=pyflow_0.3.1_amd64.deb
wget https://github.com/David-OConnor/pyflow/releases/download/$PACKAGE_VERSION/$PACKAGE_FILE -O $PACKAGE_FILE
dpkg -i $PACKAGE_FILE
rm $PACKAGE_FILE
