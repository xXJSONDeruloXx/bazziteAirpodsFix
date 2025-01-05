#!/bin/bash

# Define paths and config file
CONFIG_DIR="/etc/wireplumber/wireplumber.conf.d"
CONFIG_FILE="$CONFIG_DIR/51-mitigate-annoying-profile-switch.conf"

# Check for sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root (e.g., sudo ./fix-bluetooth-audio.sh)"
  exit 1
fi

# Create the configuration directory if it doesn't exist
if [ ! -d "$CONFIG_DIR" ]; then
  echo "Creating configuration directory at $CONFIG_DIR..."
  mkdir -p "$CONFIG_DIR"
fi

# Write the configuration
echo "Writing configuration to $CONFIG_FILE..."
cat <<EOL > "$CONFIG_FILE"
## In WirePlumber there's a bug where some applications trigger switching to Headset Profile
## --
## See issue #634, #645, #630, #629, #613
## --
## This config mitigates the issue by completely disabling the switching and support for Headset Profile (HFP)
## Using this would only make sense if you never plan on using the microphone that comes with your headset.

wireplumber.settings = {
  ## Whether to use headset profile in the presence of an input stream.
  ## --
  ## Disable for now, as it causes issues. See note at the top as to why.
  bluetooth.autoswitch-to-headset-profile = false
}

monitor.bluez.properties = {
  ## Enabled roles (default: [ a2dp_sink a2dp_source bap_sink bap_source hfp_hf hfp_ag ])
  ##
  ## Currently some headsets (Sony WH-1000XM3) are not working with
  ## both hsp_ag and hfp_ag enabled, so by default we enable only HFP.
  ##
  ## Supported roles: hsp_hs (HSP Headset),
  ##                  hsp_ag (HSP Audio Gateway),
  ##                  hfp_hf (HFP Hands-Free),
  ##                  hfp_ag (HFP Audio Gateway)
  ##                  a2dp_sink (A2DP Audio Sink)
  ##                  a2dp_source (A2DP Audio Source)
  ##                  bap_sink (LE Audio Basic Audio Profile Sink)
  ##                  bap_source (LE Audio Basic Audio Profile Source)
  ## --
  ## Only enable A2DP here and disable HFP. See note at the top as to why.
  bluez5.roles = [ a2dp_sink a2dp_source ]
}
EOL

# Restart the WirePlumber user service
echo "Restarting WirePlumber service..."
systemctl --user restart wireplumber

echo "Configuration applied successfully! Test your Bluetooth audio to ensure it works as expected."