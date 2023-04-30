#!/bin/bash
x11vnc -forever -nopw -create &
Xvfb :1 -screen 0 1024x768x24 & sleep 3 && ./ts3client_runscript.sh "ts3server://$SERVER?port=$PORT&nickname=$USERNAME"