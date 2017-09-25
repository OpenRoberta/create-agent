#!/bin/bash

user=$(whoami)
rm /home/$user/.local/share/applications/ORCreateAgent.desktop
rm /home/$user/.local/share/applications/ORCreateAgentUninstall.desktop
rm /home/$user/Desktop/ORCreateAgent.desktop
rm /home/$user/Desktop/ORCreateAgentUninstall.desktop
rm -rf /home/$user/.arduino-create
rm -rf /home/$user/ORCreateAgent
