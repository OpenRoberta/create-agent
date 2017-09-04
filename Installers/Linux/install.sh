#!/bin/bash

version="0.0.1"
dir="$( pwd )"

echo "[Desktop Entry]" > "/usr/share/applications/ORCreateAgent.desktop"
echo "Version=$version" >> "/usr/share/applications/ORCreateAgent.desktop"
echo "Name=Open Roberta Create Agent" >> "/usr/share/applications/ORCreateAgent.desktop"
echo "Exec=$dir/arduino-create-agent" >> "/usr/share/applications/ORCreateAgent.desktop"
echo "Path=$dir" >> "/usr/share/applications/ORCreateAgent.desktop"
echo "Icon=$dir/OR.png" >> "/usr/share/applications/ORCreateAgent.desktop"
echo "Terminal=false" >> "/usr/share/applications/ORCreateAgent.desktop"
echo "Type=Application" >> "/usr/share/applications/ORCreateAgent.desktop"
echo "Categories=Application;Development;Internet;" >> "/usr/share/applications/ORCreateAgent.desktop"


chmod u+x "/usr/share/applications/ORCreateAgent.desktop"
