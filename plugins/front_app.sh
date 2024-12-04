#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting


if [ "$SENDER" = "front_app_switched" ]; then
  # Limpiar el valor de INFO para eliminar espacios y caracteres no imprimibles
  CLEAN_INFO=$(echo "$INFO" | sed 's/[^[:print:]]//g')

  # Configurar el ícono y etiqueta en Sketchybar
  sketchybar --set "$NAME" label="$CLEAN_INFO" icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$CLEAN_INFO")"
fi



# LOG_FILE="$HOME/Desktop/script_debug.log"
# touch "$LOG_FILE"

# echo "------ NEW LOG ENTRY: $(date) ------" >> "$LOG_FILE"

# if [ "$SENDER" = "front_app_switched" ]; then
#   echo "App switched detected. Raw INFO='$INFO'" >> "$LOG_FILE"

#   # Limpiar el valor de INFO
#   CLEAN_INFO=$(echo "$INFO" | sed 's/[^[:print:]]//g')

#   echo "Cleaned INFO='$CLEAN_INFO'" >> "$LOG_FILE"

#   # Verificar si es WhatsApp
#   if [ "$CLEAN_INFO" = "WhatsApp" ]; then
#     echo "WhatsApp detected. Setting icon." >> "$LOG_FILE"
#   else
#     echo "Current app is not WhatsApp. CLEAN_INFO='$CLEAN_INFO'" >> "$LOG_FILE"
#   fi

#   sketchybar --set "$NAME" label="$CLEAN_INFO" icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$CLEAN_INFO")" >> "$LOG_FILE" 2>&1
# else
#   echo "No app switch detected. SENDER='$SENDER'" >> "$LOG_FILE"
# fi

# fi



