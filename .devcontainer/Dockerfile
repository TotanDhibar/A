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

# Install XFCE desktop environment and xrdp for RDP access
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xrdp \
    dbus-x11 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Setup OpenSSH
RUN mkdir /var/run/sshd

# Configure xrdp
RUN adduser xrdp ssl-cert
RUN echo "xfce4-session" > /etc/skel/.xsession

# Create a default non-root user
RUN useradd -m devuser -s /bin/bash && \
    echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Optional: set password via ARG (change it before committing)
ARG DEV_PASS=devpassword
RUN echo "devuser:${DEV_PASS}" | chpasswd

# Configure XFCE session for devuser
RUN echo "xfce4-session" > /home/devuser/.xsession && \
    chown devuser:devuser /home/devuser/.xsession

# Create startup script to run services
COPY start-services.sh /usr/local/bin/start-services.sh
RUN chmod +x /usr/local/bin/start-services.sh

# Set work directory to the Codespaces repo mount point
WORKDIR /workspaces

# Switch to the non-root user
USER devuser

# Expose SSH port and RDP port
EXPOSE 22 3389
