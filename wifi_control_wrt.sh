#! /usr/bin/env sh
#WiFi Control WRT v1.0-sh
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
probe=$( date | awk '{print $4}' | sed 's/://g' | sed 's/^0*//' )
#Shows the date probed
#echo $probe
if [ $probe -gt $morningStart ] && [ $probe -lt $morningEnd ]
then
#	echo "Enabled"
	ifconfig wlan0 up
elif [ $probe -gt $eveningStart ] && [ $probe -lt $eveningEnd ]
then
#	echo "Enabled"
	ifconfig wlan0 up
else
#	echo "Disable"
	ifconfig wlan0 down
fi
