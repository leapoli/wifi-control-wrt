ONLY FOR OPENWRT VERSION:

How to Install?

1°) Create a crontat (if not exist) as root and open it to edit
    
    crontab -e

2°) Add the selected version of script in crontab, to iterate every minute
    
    * * * * * sh /root/scripts/wifi_control_wrt.sh
    
3°) Give permission of execution
    
    chmod u+x /root/scripts/wifi_control_wrt.sh
    
4°) Begin and enable the cron daemon 
    
    /etc/init.d/cron start && /etc/init.d/cron enable
    
5°) Reboot to apply changes and check it's working
    reboot