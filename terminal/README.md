# Network Utilities

## Change MAC Address of an interface

These commands should work on MacOS and Linux. The `ethtool` utility is
Linux-only.
```commandline
ifconfig
ifconfig wlan0 down
ifconfig wlan0 hw ether 00:11:22:33:44:55
ifconfig wlan0 up
```

To restore an interface's original MAC Address, you usually just need to
reboot your computer (since the MAC changes are done in-memory only). However,
you might be able to restore the original MAC Address on Linux via:
```commandline
ethtool -P wlan0
sudo ifconfig eth0 hw ether $(ethtool -P eth0 | awk '{print $3}')
```

To change a Wi-Fi adapter mode on Linux:
```commandline
iwconfig
ifconfig wlan0 down
airmon-ng check kill

iwconfig wlan0 mode monitor
ifconfig wlan0 up
iwconfig
```

## Installing Atheros / Realtek drivers

Applicable for Wi-Fi adapters with chipsets:
* Atheros AR9271
* Realtek RTL8812AU

```commandline
apt-get install -y realtek-rtl88xxau-dkms

apt install realtek-rtl88xxau-dkms
```

# Mac References

Some helpful tricks for Mac / Unix terminal env.

## List Active USB Devices with Details

```commandline
system_profiler SPUSBDataType
```

## Install Rosetta 2 for Mac M1 Silicon Chips

```commandline
softwareupdate --install-rosetta
```

## How to check if your Terminal is in Arm64 mode
1. Open the Terminal app.
2. Type the following command and press Enter:
```bash
uname -m
```
3. The output will tell you the current architecture:
  - arm64: The terminal is running natively on Apple Silicon.
  - x86_64: The terminal is running in Intel-emulation mode via Rosetta 2. 

## For a separate, dedicated x86 terminal
A more permanent solution is to create a duplicate Terminal app that is always configured to use Rosetta 2. 

1. Navigate to your Applications/Utilities folder in Finder.
2. Right-click the Terminal app and select Duplicate.
3. Rename the copy to something like "Rosetta Terminal."
4. Right-click the new app and select Get Info.
