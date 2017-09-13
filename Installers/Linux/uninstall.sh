#!/bin/bash

user=$(whoami)
rm /home/$user/.local/share/applications/ORCreateAgent.desktop
rm -rf /home/$user/.arduino-create
rm -rf /home/$user/ORCreateAgent
