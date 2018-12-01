#!/bin/bash

DISTRIB_DESCRIPTION=$(cat /etc/centos-release)

#change 'CentOS' to something else, if you want to name your server or display a phrase
DISPLAYNAME=$(hostname | python -c "import sys; print(sys.stdin.read().strip().lower().capitalize())")
LOLCAT=/usr/local/bin/lolcat #whereis lolcat if your system put it somewhere else

figlet $DISPLAYNAME -c | $LOLCAT -f
printf "\n"

printf "\t%s \tKernel: %s\n" "$DISTRIB_DESCRIPTION" "$(uname -r)"
printf "\n"


date=$(date)
LOAD1=$(cat /proc/loadavg | awk '{print $1}')
LOAD5=$(cat /proc/loadavg | awk '{print $2}')
LOAD15=$(cat /proc/loadavg | awk '{print $3}')

# uptime
uptime=$(cat /proc/uptime | cut -f1 -d.)
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
upSecs=$((uptime%60))

# filesystem info
root_usage=$(df -h / | awk '/\// {print $4}'|grep -v "^$")

# memory
memory_usage=$(free -t -m | grep Total | awk '{print $3;}')
total_memory=$(free -t -m | grep "Mem" | awk '{print $2" MB";}')
swap_usage=$(free -m | awk '/Swap/ { printf("%3.1f%%", $3/$2*100) }')

# users
users=$(users | wc -w)

# processes
processes=$(ps aux | wc -l)

printf "\tSystem information as of: %s\n\n" "$date"
printf "\tSystem Load:\t%s %s %s\tSystem Uptime:\t\t%s days %s hours %s min %s sec\n" "$LOAD1", "$LOAD5", "$LOAD15" "$upDays" "$upHours" "$upMins" "$upSecs"
printf "\tMemory Usage:\t%s\t\tSwap Usage:\t\t%s\n" "$memory_usage"/"$total_memory" "$swap_usage"
printf "\tUsage:\t\t%s\t\t\tSFTP Accounts:\t\t%s\n" "$root_usage" "$users"
printf "\tProcesses:\t%s\t\t\t\n\n" "$processes"

#include the updater; sourced from update-check.sh
source /etc/update-motd.d/90-updates-available
printf "\n\n"
