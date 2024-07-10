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

# Clean up
RUN apt clean && \
    rm -rf /var/lib/apt/lists/*

# Switch to the non-root user
USER ${USER_NAME}
