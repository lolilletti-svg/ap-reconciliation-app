#!/bin/bash
cd "$(dirname "$0")"
# Si ya hay un servidor corriendo en 8080, lo cierra primero
lsof -ti:8080 | xargs kill -9 2>/dev/null
# Arranca el servidor en el fondo (sin ventana de Terminal)
nohup python3 -m http.server 8080 > /dev/null 2>&1 &
disown
sleep 0.8
# Abre la app en Chrome
open "http://localhost:8080/reconciliation-app.html"
