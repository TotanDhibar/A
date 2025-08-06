# See https://aka.ms/vscode-remote/devcontainer/base for more info.
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y sudo locales openssh-server curl wget git ca-certificates && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8

RUN mkdir /var/run/sshd && echo 'root:devcontainer' | chpasswd && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN useradd -m vscode && echo 'vscode ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/vscode && chmod 0440 /etc/sudoers.d/vscode

EXPOSE 2222

CMD ["/usr/sbin/sshd", "-D"]