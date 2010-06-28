#!/system/bin/sh

# no sleep?
#echo s5NoSleep > /sys/power/wake_lock

#turn on BT
/system/xbin/s5_onoff 0x2 0x1
#modprobe libertas_sdio		# moved to initrd"

#netcfg eth0 dhcp
#setprop net.dns1 4.2.2.2

## For wifi, we'll need this:

# insmod ath_hal.ko
# insmod wlan.ko
# insmod wlan_scan_sta.ko
# insmod ath_rate_sample.ko
# insmod ath_pci.ko
