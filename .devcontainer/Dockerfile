FROM mcr.microsoft.com/devcontainers/base:ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends xfce4 xfce4-terminal dbus-x11 xvfb x11vnc novnc websockify firefox-esr sudo curl git ca-certificates && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN echo 'vscode ALL=(ALL) NOPASSWD:ALL' >/etc/sudoers.d/vscode
EXPOSE 6080
