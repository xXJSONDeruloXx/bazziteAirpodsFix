#!/bin/bash

############################################################
# Sleep/Wakeup Fix For Gigabyte Motherboards originally from https://raw.githubusercontent.com/DAK404/OpenSUSE-Setup-Scripts/main/GigabyteDesktop_Sleep_Fix.sh

############################################################

sudo cat > /etc/systemd/system/biosWakeupWorkaround.service << EOL
[Unit]
Description=Workaround for Gigabyte BIOS sleep/wakeup bug

[Service]
Type=oneshot
ExecStart = /bin/sh -c 'if grep 'GPP0' /proc/acpi/wakeup | grep -q 'enabled'; then echo 'GPP0' > /proc/acpi/wakeup; fi'

[Install]
WantedBy = multi-user.target
EOL

sudo systemctl daemon-reload && sudo systemctl enable biosWakeupWorkaround.service