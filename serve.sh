#!/usr/bin/env bash
# Serveix els fitxers de manualitats amb un servidor HTTP local
PORT=8080
echo "Servint a http://localhost:$PORT"
echo "Ctrl+C per aturar"
open "http://localhost:$PORT" 2>/dev/null || xdg-open "http://localhost:$PORT" 2>/dev/null &
python3 -m http.server "$PORT"
