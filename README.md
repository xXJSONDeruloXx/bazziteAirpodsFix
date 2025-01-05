# WirePlumber Bluetooth Audio Fix

This script disables the auto-switching to low-quality Headset Profile (HFP) in WirePlumber, which is a common issue for some Bluetooth headsets when connecting on Linux. It ensures your headphones remain in high-quality audio mode (A2DP).

## How It Works
- Disables auto-switching to the headset profile (HFP).
- Configures WirePlumber to only use A2DP profiles.
- Works for most distributions using PipeWire with WirePlumber.

## Usage

Run the following command to apply the fix:

```bash
curl -sSL https://raw.githubusercontent.com/<your-username>/wireplumber-bluetooth-fix/main/fix-bluetooth-audio.sh | sudo bash