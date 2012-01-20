#!/system/bin/sh

TEMPERATURE_LOG=/data/temperature_log

# Get the serial number
set -- `idme serial`
SERIAL=$3

echo "#serial[$SERIAL]" > $TEMPERATURE_LOG
echo '#time,battery_temp,bandgap_temp_min,bandgap_temp_max,battery_ntc_temp,charger_ntc_temp,pcb_temp,emif0_temp,emif1_temp' >> $TEMPERATURE_LOG

while true; do
	sleep 60

	NOW=$(date +%s)
	BATTERY_TEMP=$(cat /sys/class/power_supply/battery/temp)
	BANDGAP_TEMP_MIN=$(cat /sys/class/hwmon/hwmon1/device/temp1_min)
	BANDGAP_TEMP_MAX=$(cat /sys/class/hwmon/hwmon1/device/temp1_max)
	BATTERY_NTC_TEMP=$(cat /sys/class/hwmon/hwmon2/device/temp1_input)
	CHARGER_NTC_TEMP=$(cat /sys/class/hwmon/hwmon2/device/temp2_input)

	# Cut the first line for PCB temperature
	PCB_TEMP=$(cat /sys/class/hwmon/hwmon0/device/temp1_input)
	set -- $PCB_TEMP
	PCB_TEMP=$1

	# Cut the first line for EMIF0 temperature
	EMIF0_TEMP=$(cat /sys/devices/platform/omap_emif.0/temperature)
	set -- $EMIF0_TEMP
	EMIF0_TEMP=$1

	# Cut the first line for EMIF1 temperature
	EMIF1_TEMP=$(cat /sys/devices/platform/omap_emif.1/temperature)
	set -- $EMIF1_TEMP
	EMIF1_TEMP=$1

	echo "$NOW,$BATTERY_TEMP,$BANDGAP_TEMP_MIN,$BANDGAP_TEMP_MAX,$BATTERY_NTC_TEMP,$CHARGER_NTC_TEMP,$PCB_TEMP,$EMIF0_TEMP,$EMIF1_TEMP" >> $TEMPERATURE_LOG
done
