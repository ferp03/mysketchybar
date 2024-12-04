# #!/bin/bash

# # Tamaño de página en bytes (4 KB por página)
# page_size=$(sysctl -n hw.pagesize)

# # Obtener las páginas activas, inactivas, y cableadas
# pages_active=$(vm_stat | grep "Pages active" | awk '{print $3}' | sed 's/\.//')
# pages_wired=$(vm_stat | grep "Pages wired down" | awk '{print $4}' | sed 's/\.//')
# pages_compressed=$(vm_stat | grep "Pages occupied by compressor" | awk '{print $5}' | sed 's/\.//')

# # Calcular la memoria usada (en bytes)
# used_mem=$(( (pages_active + pages_wired + pages_compressed) * page_size ))

# # Obtener la memoria total (en bytes)
# total_mem=$(sysctl -n hw.memsize)

# # Calcular el porcentaje de memoria utilizada
# mem_used_percent=$(echo "scale=2; $used_mem / $total_mem * 100" | bc)

# # Redondear el porcentaje a un número entero
# mem_used_percent=$(printf "%.0f" $mem_used_percent)

# # Actualizar SketchyBar con el valor obtenido
# sketchybar --set $NAME label="$mem_used_percent%"

# Tamaño de página en bytes (4 KB por página)
page_size=$(sysctl -n hw.pagesize)

# Obtener las páginas activas, inactivas, y cableadas
pages_active=$(vm_stat | grep "Pages active" | awk '{print $3}' | sed 's/\.//')
echo $pages_active
pages_wired=$(vm_stat | grep "Pages wired down" | awk '{print $4}' | sed 's/\.//')
echo $pages_wired
pages_compressed=$(vm_stat | grep "Pages occupied by compressor" | awk '{print $5}' | sed 's/\.//')
echo $pages_compressed

# Calcular la memoria usada (en bytes)
used_mem=$(( (pages_active + pages_wired + pages_compressed) * page_size ))

# Convertir a gigabytes
used_mem_gb=$(echo "scale=2; $used_mem / (1024^3)" | bc)

# Mostrar la memoria usada en gigabytes
echo "${used_mem_gb} GB"

sketchybar --set $NAME label="$used_mem_gb GB"

