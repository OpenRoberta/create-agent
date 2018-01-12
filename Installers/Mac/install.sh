#!/bin/sh

user=$(whoami)

echo "Copying tools to $HOME/.arduino-create..."
cp -r /Users/Shared/arduino-create $HOME/.arduino-create
echo "{\"apilevel\":\"v1\",\"avrdude\":\"$HOME/.arduino-create/arduino/avrdude/6.3.0-arduino9\",\"avrdude-6.3.0-arduino9\":\"$HOME/.arduino-create/arduino/avrdude/6.3.0-arduino9\"}" > $HOME/.arduino-create/installed.json
chown -R $USER $HOME/.arduino-create
