FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    git \
    vim \
    sudo \
    openssh-server \
    build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Setup OpenSSH
RUN mkdir /var/run/sshd

# Create default user
RUN useradd -m devuser -s /bin/bash && \
    echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Optional: Set a simple password (avoid in public repos)
RUN echo "devuser:devpassword" | chpasswd

EXPOSE 22

USER devuser
WORKDIR /home/devuser
