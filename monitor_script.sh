#!/bin/bash

check_status() {
    SERVICE=$1

    STATUS=$(systemctl status $SERVICE.service | awk '/Active:/ {print $2}')

    if [[ "$STATUS" == 'inactive' || "$STATUS" == 'failed' ]]; then
        sudo systemctl restart $SERVICE
        LOG_TIME=$(date +%Y-%m-%d_%H-%M-%S)
        echo "[" $LOG_TIME "] Service" $SERVICE "has been restarted." >> /var/log/service_monitor.log
    fi


}

main() {
    while [[ -n "$@" ]]
    do
        echo $1
        check_status $1
        shift 1
    done
}

main "$@"
