#!/usr/bin/env bash
set -e
export DISPLAY=:1
export XDG_RUNTIME_DIR="/tmp/runtime-$(id -u)"
mkdir -p "$XDG_RUNTIME_DIR"
chmod 700 "$XDG_RUNTIME_DIR"
pkill -f "Xvfb :1" 2>/dev/null || true
pkill -f "x11vnc.*5901" 2>/dev/null || true
pkill -f "websockify.*6080" 2>/dev/null || true
Xvfb :1 -screen 0 1366x768x24 -ac +extension GLX +render -noreset >/tmp/cloud-pc-xvfb.log 2>&1 &
sleep 2
dbus-launch --exit-with-session startxfce4 >/tmp/cloud-pc-xfce.log 2>&1 &
sleep 5
x11vnc -display :1 -rfbport 5901 -forever -shared -nopw >/tmp/cloud-pc-vnc.log 2>&1 &
websockify --web=/usr/share/novnc/ 6080 localhost:5901 >/tmp/cloud-pc-novnc.log 2>&1 &
echo "Private Cloud PC started. Open Codespaces port 6080."
