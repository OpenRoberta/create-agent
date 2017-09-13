#!/bin/bash

version="0.0.1"
user=$(whoami)
dir="/home/$user/ORCreateAgent"
desktop_file="/home/$user/.local/share/applications/ORCreateAgent.desktop"

echo "[Desktop Entry]" > $desktop_file
echo "Version=$version" >> $desktop_file
echo "Name=Open Roberta Create Agent" >> $desktop_file
echo "Exec=$dir/arduino-create-agent" >> $desktop_file
echo "Path=$dir" >> $desktop_file
echo "Icon=$dir/OR.png" >> $desktop_file
echo "Terminal=false" >> $desktop_file
echo "Type=Application" >> $desktop_file
echo "Categories=Application;Development;Internet;" >> $desktop_file


chmod u+x $desktop_file

mkdir $dir
cp arduino-create-agent $dir
cp config.ini $dir

cp -r .arduino-create /home/$user/
echo "{\"apilevel\":\"v1\",\"avrdude\":\"/home/$user/.arduino-create/arduino/avrdude/6.3.0-arduino9\",\"avrdude-6.3.0-arduino9\":\"/home/$user/.arduino-create/arduino/avrdude/6.3.0-arduino9\"}" > /home/$user/.arduino-create/installed.json
