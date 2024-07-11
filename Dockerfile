# Copyright (c) 2024 RFull Development
# This source code is managed under the MIT license. See LICENSE in the project root.
FROM python:3.12-bookworm

# Install dependencies
RUN apt update && \
    apt install -y sudo gnupg2

# Create a non-root user
ARG USER_NAME=developer
RUN useradd -m ${USER_NAME} -s /bin/bash
RUN echo "$USER_NAME ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER_NAME}

# Install development tools
RUN pip install --upgrade pip

# Switch to the non-root user
USER ${USER_NAME}
WORKDIR /home/${USER_NAME}

# Install development tools
COPY --chown=${USER_NAME}:${USER_NAME} ./shells/ ./shells/
RUN cd ./shells && \
    chmod +x install.sh && \
    ./install.sh && \
    cd ..
RUN rm -rf ./shells

# Clean up
RUN sudo apt clean && \
    sudo rm -rf /var/lib/apt/lists/*
