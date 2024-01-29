#!/bin/bash

# Define thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=70
DISK_THRESHOLD=80
PROCESS_THRESHOLD=80


# Get system metrics
CPU_USAGE=$(top -b -n 1 | awk '/^%Cpu/{print int($2)}')
MEMORY_USAGE=$(free | awk '/^Mem/{print int(($3/$2) * 100)}')
DISK_USAGE=$(df --total -h | tail -n 1 | awk '{print int($5)}')
RUNNING_PROCESSES=$(ps aux --no-headers | wc -l)
MAX_PROCESSES=$(cat /proc/sys/kernel/pid_max)
PROCESS_PERCENTAGE=$(( (RUNNING_PROCESSES * 100) / MAX_PROCESSES ))



# Display results
 
echo -e "\e[32m CPU Usage: \e[0m        ""$CPU_USAGE%"
echo -e "\e[32m Memory Usage: \e[0m     ""$MEMORY_USAGE%"
echo -e "\e[32m Disk Usage: \e[0m       ""$DISK_USAGE%"
echo -e "\e[32m Running Processes:\e[0m ""$PROCESS_PERCENTAGE%"

# Function to log an alert
log_alert() {
    local MESSAGE=$1
    echo "$(date +"%Y-%m-%d %H:%M:%S"): $MESSAGE" >> system_health.log
}

# Check and alert if thresholds are exceeded
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    log_alert "High CPU usage detected: $CPU_USAGE%"
    echo -e "\e[31m High CPU usage detected: $CPU_USAGE%\e[0m"

fi

if [ "$MEMORY_USAGE" -gt "$MEMORY_THRESHOLD" ]; then
    log_alert "High memory usage detected: $MEMORY_USAGE%"
    echo -e "\e[31m High memory usage detected: $MEMORY_USAGE%\e[0m"

fi

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    log_alert "High disk usage detected: $DISK_USAGE%"
    echo -e "\e[31m High disk usage detected: $DISK_USAGE%\e[0m"

fi

if [ "$PROCESS_PERCENTAGE" -gt "$PROCESS_THRESHOLD" ]; then
    log_alert "High number of running processes detected: $RUNNING_PROCESSES"
    echo -e "\e[31m High number of running processes detected: $RUNNING_PROCESSES\e[0m"

fi




