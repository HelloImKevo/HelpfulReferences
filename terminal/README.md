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
