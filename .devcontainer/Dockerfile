FROM ubuntu:20.04

# Avoid interactive prompts during apt installs
ENV DEBIAN_FRONTEND=noninteractive

# Install base packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    vim \
    sudo \
    openssh-server \
    build-essential \
    python3 \
    python3-pip \
    python3-venv \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Setup OpenSSH
RUN mkdir /var/run/sshd

# Create a default non-root user
RUN useradd -m devuser -s /bin/bash && \
    echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Optional: set password via ARG (change it before committing)
ARG DEV_PASS=devpassword
RUN echo "devuser:${DEV_PASS}" | chpasswd

# Set work directory to the Codespaces repo mount point
WORKDIR /workspaces

# Switch to the non-root user
USER devuser

# Expose SSH port (only useful if you set up port forwarding)
EXPOSE 22
