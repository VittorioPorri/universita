#!/bin/bash
if [ -z "$1" ]; then
  echo "Uso: $0 /percorso/della/cartella"
  exit 1
fi


TARGET_DIR="$1"


mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR" || exit 1


npm init -y
cp /home/vitto/github/universita/PW/esami/template/index.js .
touch data.json test.http
mkdir -p public
cp /home/vitto/github/universita/PW/esami/template/home.html ./public/home.html
touch public/home.css public/home.js
npm install cors express morgan
npm install --save-dev nodemon

echo "Completato in '$TARGET_DIR'"
