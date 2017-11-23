'''
WiFi Control WRT v1.0-py

Copyright (C) 2017 Leandro Poli

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>
'''
import time;
import subprocess;
# Format of hour: HHMMSS
startMorning = 93000;
endMorning = 123000;
startEvening = 170000;
endEvening = 203000;
timestamp = int(time.strftime("%H%M%S"));
if(timestamp >= startMorning and timestamp <= endMorning):
	print("WiFi enabled by morning");
	subprocess.call(["wlan0", "up"]);
	#If not working, use "wifi up"
elif(timestamp >= startEvening and timestamp <= endEvening):
	print("WiFi enabled by evening");
	subprocess.call(["wlan0", "up"]);
	#If not working, use "wifi up"
else:
	print("WiFi disabled");
	subprocess.call(["wlan0", "down"]);
	#If not working, use "wifi down"
