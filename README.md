# WirePlumber Bluetooth Audio Fix

This script fixes the issue where Bluetooth headphones (e.g., AirPods Pro) default to the low-quality **Headset Profile (HFP)** due to a bug in WirePlumber. It ensures your headphones stay in high-quality audio mode (**A2DP**) by disabling auto-switching to HFP.

## How It Works
- Disables auto-switching to the headset profile (HFP) in WirePlumber.
- Configures WirePlumber to only use high-quality A2DP profiles.
- Works on most Linux distributions using **PipeWire** with **WirePlumber**.

## Usage

Run the following command to apply the fix:

```bash
curl -sSL https://raw.githubusercontent.com/xXJSONDeruloXx/bazziteSetupScripts/main/fix-bluetooth-audio.sh | sudo bash
```

## Script to make SSH available on boot

Script that enables and allows SSH and then enables on boot and bypasses firewall if necessary:

```bash
curl -sSL https://raw.githubusercontent.com/xXJSONDeruloXx/bazziteSetupScripts/main/setupSSH.sh | sudo bash
```

## Gigabyte Motherboard Wake Fix

Script for fixing sleep mode on linux for desktops using gigabyte boards (originally from https://github.com/DAK404):

```bash
curl -sSL https://raw.githubusercontent.com/xXJSONDeruloXx/bazziteSetupScripts/main/gigabyteWakeFix.sh | sudo bash
```
