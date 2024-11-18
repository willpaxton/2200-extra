# 2200-extra
The following outlines the functionality and instructions to use the monitoring script and custom hello service.

## Monitoring Script
This script checks the status of multiple different services (fed into the script as arguments) and will restart them if their status is set to "inactive" or "failed". If a restart occurs, it will be logged to a log file at /var/log/service_monitor.log with the time of the restart.
### Usage:
```
sudo ./monitor_script.sh [list_of_services]
sudo ./monitor_script.sh ssh mysql apache2 smbd hello
```

## Start/Stopping the Custom Service
The custom hello service prints "Hello, world!" to a log file once a minute.
The custom service is managed by systemctl.  The service can be started with `systemctl start hello.service` and stopped with `systemctl stop hello.service`.
Using `sudo systemctl enable hello.service` allows the service to start on botm.  

## Cron Job
`register_cron.sh` adds an entry to crontab that will run the monitoring script every five minutes.  More specifically, this script checks if the entry exists, and if it doesn't, it will append the crontab entry to the end of the crontab file and restart cron to ensure that it is active.  
### Usage
```
sudo ./register_cron.sh
```
