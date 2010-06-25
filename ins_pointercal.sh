#!/bin/sh
#enable touch screen : s5
/system/xbin/iowrite 0x1de 0x5a
/system/xbin/iowrite 0x1df 0xa5
/system/xbin/ioread 0x1de

if [ -f /system/etc/pointercal ]; then
	mkdir /data/system
	mkdir /data/system/tslib
	chown 1000.1000 /data/system/tslib
	cp /system/etc/pointercal /data/system/tslib/pointercal
	chown 1000.1000 /data/system/tslib/pointercal
fi
