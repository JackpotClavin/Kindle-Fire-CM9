#!/system/bin/sh

BATTERY_LOG=/data/battery_log

# Get the serial number
set -- `idme serial`
SERIAL=$3

echo "#serial[$SERIAL]" > $BATTERY_LOG
echo '#time,temp,voltage,current,capacity,charge,charge_full' >> $BATTERY_LOG

while true; do
	sleep 60

	NOW=$(date +%s)
	BATTERY_TEMP=$(cat /sys/class/power_supply/battery/temp)
	BATTERY_VOLTAGE=$(cat /sys/class/power_supply/battery/voltage_now)
	BATTERY_CURRENT=$(cat /sys/class/power_supply/battery/current_now)
	BATTERY_CAPACITY=$(cat /sys/class/power_supply/battery/capacity)
	BATTERY_CHARGE=$(cat /sys/class/power_supply/battery/charge_now)
	BATTERY_CHARGE_FULL=$(cat /sys/class/power_supply/battery/charge_full)

	echo "$NOW,$BATTERY_TEMP,$BATTERY_VOLTAGE,$BATTERY_CURRENT,$BATTERY_CAPACITY,$BATTERY_CHARGE,$BATTERY_CHARGE_FULL" >> $BATTERY_LOG
done
