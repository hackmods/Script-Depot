#!/bin/bash
# Set the default screenshot save location to your documents

defaults write com.apple.screencapture location ~/Documents/Screenshots
killall SystemUIServer

exit;