#!/usr/bin/env bash

# Ejecuta conky con la configuración de texto y guarda la salida en una variable
# Redirigimos los errores (stderr) a /dev/null para evitar mensajes basura de inicialización
INFO_CONKY=$(conky -i 1 -c "$HOME/.config/conky/conkyNotify.lua" 2>/dev/null)

# Envía la información a través de notify-send
# Usamos el flag -a para darle un nombre a la aplicación y un icono de sistema
notify-send -a "ESTADO DEL SISTEMA" -i "$HOME/.config/conky/info.png" "$INFO_CONKY"
