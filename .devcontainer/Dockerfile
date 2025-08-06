# Use the official Ubuntu 20.04 image as the base
FROM ubuntu:20.04

# Set a non-root user (good practice for security)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user and install common dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    curl \
    vim \
    gnupg2 \
    openssh-server \
    # Clean up APT cache to keep the image small
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    # Create the user
    && groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=(ALL) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Set the default user
USER $USERNAME

# Set the working directory
WORKDIR /home/$USERNAME
