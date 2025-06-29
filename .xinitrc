#!/bin/sh

# Generate colors with pywal (waits until it's done)
wal -i ~/Pictures/mountain.jpg

# Merge custom Xresources after wal to override any changes
xrdb -merge ~/xres/x4

# Start your window manager
exec dwm
