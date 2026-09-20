FROM mcr.microsoft.com/devcontainers/base:ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends xfce4 xfce4-goodies dbus-x11 xvfb x11vnc novnc websockify firefox fonts-dejavu sudo && rm -rf /var/lib/apt/lists/*
