#!/bin/bash

# Abrir Microsoft Outlook en la vista del calendario
osascript -e 'tell application "Microsoft Outlook" to activate' \
          -e 'tell application "System Events" to keystroke "2" using command down'
