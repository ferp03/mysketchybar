#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

# Debug: Print the value of $SELECTED and $NAME
echo "SELECTED: $SELECTED"
echo "NAME: $NAME"

# Ensure $SELECTED is not empty
if [ -z "$SELECTED" ]; then
  echo "SELECTED is not set"
  exit 1
fi

# Ensure $NAME is not empty
if [ -z "$NAME" ]; then
  echo "NAME is not set"
  exit 1
fi

source "$CONFIG_DIR/colors.sh"

#espacio seleccionado
if [ "$SELECTED" = true ]; then
  echo "Space is selected"
  sketchybar --set $NAME background.drawing=on \
                         background.color=0x00000000 \
                         label.color=$WHITE \
                         icon.color=$WHITE
else
  echo "Space is not selected"
  sketchybar --set $NAME background.drawing=off \
                         label.color=0xB0BEC5FF \
                         icon.color=0xB0BEC5FF
fi

# Debug: Check the exit status of the last command
if [ $? -ne 0 ]; then
  echo "Error executing sketchybar command"
  exit 1
fi