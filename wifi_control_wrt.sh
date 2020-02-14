#! /usr/bin/env sh
#WiFi Control WRT v1.1
#
#Copyright (C) 2017 Leandro Poli
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>

morningStart=93000
morningEnd=123000
eveningStart=170000
eveningEnd=203000

interface="wlan0"

# Syncronized NTP

ntpd -q -p ptbtime1.ptb.de

# Return data in format HHMMSS

probe=$( date | awk '{print $4}' | sed 's/://g' | sed 's/^0*//' )

# Check if wlan0 is activated. Search for word "UP"

keyWord='UP'

wirelessActivated=$(ifconfig $interface| grep -cs $keyWord)

#Shows the date probed
#echo $probe

# Morning: started
if [ $probe -gt $morningStart ] && [ $probe -lt $morningEnd ]
then

	# If is turned off, then start. 
	# Else, do nothing cause it's already on.
	if [ $wirelessActivated -eq 0 ]
	then	
		echo "Status: $interface disabled. Action: Not in range, enabling."
		uci set wireless.@wifi-iface[0].disabled=0 && uci commit wireless && wifi
	else
		echo "Status: $interface enabled. Action: In range, nothing to do."
	fi

# Evening: started
elif [ $probe -gt $eveningStart ] && [ $probe -lt $eveningEnd ]
then
	# If is turned off, then start. 
	# Else, do nothing cause it's already on.
	if [ $wirelessActivated -eq 0 ]
	then	
		echo "Status: $interface disabled. Action: Not in range, enabling."
		uci set wireless.@wifi-iface[0].disabled=0 && uci commit wireless && wifi
	else
		echo "Status: $interface enabled. Action: In range, nothing to do."
	fi

# Whenever else: stopped
else
	# If is turned on, then stop. 
	# Else, do nothing cause it's already off.
	if [ $wirelessActivated -eq 1 ]
	then	
		echo "Status: $interface enabled. Action: Not in range, disabling."
		uci set wireless.@wifi-iface[0].disabled=1 && uci commit wireless && wifi
	else
		echo "Status: $interface disabled. Action: In range, nothing to do."
	fi
fi
