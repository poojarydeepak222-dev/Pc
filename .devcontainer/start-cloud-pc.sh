#!/usr/bin/env bash
set -e
mkdir -p /tmp/cloudpc
if pgrep -x Xvfb >/dev/null; then exit 0; fi
Xvfb :1 -screen 0 1280x800x24 -ac >/tmp/cloudpc/xvfb.log 2>&1 &
export DISPLAY=:1
sleep 2
dbus-launch --exit-with-session startxfce4 >/tmp/cloudpc/xfce.log 2>&1 &
sleep 4
x11vnc -display :1 -forever -shared -rfbport 5900 -nopw >/tmp/cloudpc/x11vnc.log 2>&1 &
websockify --web=/usr/share/novnc/ 6080 localhost:5900 >/tmp/cloudpc/novnc.log 2>&1 &
echo "Private Cloud PC running on port 6080"
