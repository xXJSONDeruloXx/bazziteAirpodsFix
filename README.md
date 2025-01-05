WirePlumber Bluetooth Audio Fix

This script fixes the issue where Bluetooth headphones (e.g., AirPods Pro) default to the low-quality Headset Profile (HFP) due to a bug in WirePlumber. It ensures your headphones stay in high-quality audio mode (A2DP) by disabling auto-switching to HFP.

How It Works
	•	Disables auto-switching to the headset profile (HFP) in WirePlumber.
	•	Configures WirePlumber to only use high-quality A2DP profiles.
	•	Works on most Linux distributions using PipeWire with WirePlumber.

Usage

Run the following command to apply the fix:

curl -sSL https://raw.githubusercontent.com/xXJSONDeruloXx/bazziteAirpodsFix/main/fix-bluetooth-audio.sh | sudo bash

What the Script Does
	1.	Creates a configuration file: /etc/wireplumber/wireplumber.conf.d/51-mitigate-annoying-profile-switch.conf.
	2.	Updates WirePlumber settings to disable HFP switching.
	3.	Restarts the WirePlumber service to apply the changes.

Notes
	•	This fix disables the use of built-in microphones on Bluetooth headsets.
	•	Tested on Fedora 41 (Bazzite) with AirPods Pro v2.
	•	You must have WirePlumber installed and running for this fix to work.

Manual Instructions

If you prefer not to use the script, follow these steps manually:
	1.	Create the configuration directory (if it doesn’t exist):

sudo mkdir -p /etc/wireplumber/wireplumber.conf.d


	2.	Create the file:

sudo nano /etc/wireplumber/wireplumber.conf.d/51-mitigate-annoying-profile-switch.conf


	3.	Add the following content to the file:

wireplumber.settings = {
  bluetooth.autoswitch-to-headset-profile = false
}

monitor.bluez.properties = {
  bluez5.roles = [ a2dp_sink a2dp_source ]
}


	4.	Restart WirePlumber:

systemctl --user restart wireplumber

