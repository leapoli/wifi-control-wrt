** ONLY FOR OPENWRT VERSION **

How to Install?

1) Edit as prefer the variables for the time (morningStart, morningEnd, 
    eveningStart, eveningEnd) and the interface (check your wireless interface
    name with the command ifconfig and edit the "interface" variable).

2) Create a crontat (if not exist) as root and open it to edit
    
    crontab -e

3) Add the selected version of script in crontab, to iterate every minute
    
    * * * * * sh /root/scripts/wifi_control_wrt.sh
    
4) Give permission of execution
    
    chmod u+x /root/scripts/wifi_control_wrt.sh
    
5) Begin and enable the cron daemon 
    
    /etc/init.d/cron start && /etc/init.d/cron enable
    
6) Reboot to apply changes and check it's working
    reboot