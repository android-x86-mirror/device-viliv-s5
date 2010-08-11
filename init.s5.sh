#!/system/bin/sh

#turn on wifi
/system/bin/s5_onoff 0x7 0x1

# no sleep!
echo s5NoSleep > /sys/power/wake_lock

#turn on BT
usleep 10000
/system/bin/s5_onoff 0x2 0x1

#netcfg eth0 dhcp
#setprop net.dns1 4.2.2.2

## For wifi, we'll need this:

# insmod ath_hal.ko
# insmod wlan.ko
# insmod wlan_scan_sta.ko
# insmod ath_rate_sample.ko
# insmod ath_pci.ko
