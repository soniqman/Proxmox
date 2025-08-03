#!/bin/bash

# Navigate to the Proxmox JavaScript toolkit directory
cd /usr/share/javascript/proxmox-widget-toolkit || { echo "Directory not found"; exit 1; }

# Backup the original proxmox.js file
cp proxmox.js proxmox.js.back
echo "Backup created: proxmox.js.back"

# Modify the subscription check line
sed -i "s/res\.data\.status\.toLowerCase() !== 'active'/res.data.status.toLowerCase() == 'active'/g" proxmox.js
echo "Subscription check modified."

# Reminder to clear browser cache
echo "Please clear your browser cache manually to apply the changes."
