# System Health and Access Log Analyzer Scripts

This repository contains two Bash scripts for monitoring system health and analyzing web server access logs.



# 1. System Health Monitoring Script:
This Bash script monitors various system metrics and alerts if certain thresholds are exceeded. It provides information on CPU usage, memory usage, disk usage, and the percentage of running processes.

## Usage

1. Make the script executable:

    ```bash
    chmod +x health_check.sh
    ```

2. Run the script:

    ```bash
    ./health_check.sh
    ```

## Metrics Monitored

### CPU Usage
Displays the percentage of CPU usage. If the usage exceeds the defined threshold, an alert is logged and displayed in red.

### Memory Usage
Displays the percentage of used memory. If the usage exceeds the defined threshold, an alert is logged and displayed in red.

### Disk Usage
Displays the percentage of used disk space. If the usage exceeds the defined threshold, an alert is logged and displayed in red.

### Running Processes
Displays the percentage of running processes out of the maximum allowed. If the percentage exceeds the defined threshold, an alert is logged and displayed in red.

## Configuration

You can configure the script by adjusting the threshold values at the beginning of the script:

```bash
CPU_THRESHOLD=80
MEMORY_THRESHOLD=70
DISK_THRESHOLD=80
PROCESS_THRESHOLD=80
```


# 2. Access Log Analyzer

This Bash script analyzes web server access logs and provides a summary of important information such as top request IPs, request methods, pages, and 404 errors. The script uses color-coded output to make it easier to interpret the results.

## Usage

1. Make the script executable:

    ```bash
    chmod +x log_analyzer.sh
    ```

2. Run the script with your access log as an argument:

    ```bash
    ./log_analyzer.sh your_access_log
    ```


## Summary Information

### Top 10 Request IPs

Displays the top 10 IP addresses making requests.

### Top 10 GET Requests

Displays the top 10 GET requests along with the number of occurrences.

### Top 10 POST Requests

Displays the top 10 POST requests along with the number of occurrences.

### Top 10 Request Pages

Displays the top 10 requested pages along with the number of occurrences.

### Top 10 404 Page Responses

Displays the top 10 occurrences of 404 page responses.

### Number of 404 Errors

Displays the total number of 404 errors in the log.

## Example Usage

```bash
./log_analyzer.sh your_access_log
```
![image](https://github.com/KUNAL-MAURYA1470/script/assets/83691101/b90d9d6f-e33e-4294-9fc9-83bdc926c264)

