# WirePlumber Bluetooth Audio Fix

This script fixes the issue where Bluetooth headphones (e.g., AirPods Pro) default to the low-quality **Headset Profile (HFP)** due to a bug in WirePlumber. It ensures your headphones stay in high-quality audio mode (**A2DP**) by disabling auto-switching to HFP.

## How It Works
- Disables auto-switching to the headset profile (HFP) in WirePlumber.
- Configures WirePlumber to only use high-quality A2DP profiles.
- Works on most Linux distributions using **PipeWire** with **WirePlumber**.

## Usage

Run the following command to apply the fix:

```bash
curl -sSL https://raw.githubusercontent.com/xXJSONDeruloXx/bazziteAirpodsFix/main/fix-bluetooth-audio.sh | sudo bash