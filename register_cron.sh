#!/bin/bash

CRON_STRING="*/5 * * * * root /home/paxtonw/monitor_script.sh ssh mysql apache2 smbd hello"

main() {
    grep -F "$CRON_STRING" /etc/crontab > /dev/null 2>&1

    if [[ $? -eq 1 ]]; then
        sudo echo "$CRON_STRING" >> /etc/crontab
        echo "Inputted monitor_script.sh as a crontab entry."
        sudo systemctl restart cron
        exit 0
    else
        echo "monitor_script.sh already registed as a crontab entry."
        exit 1

    fi
}

main
