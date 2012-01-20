#!/system/bin/sh

TOUCH_FIRMWARE=`cat /sys/class/input/input1/device/version`

log -p i -t metrics.touch "system:def:touch_firmware=$TOUCH_FIRMWARE:"
