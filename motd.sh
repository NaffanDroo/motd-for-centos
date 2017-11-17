#!/bin/sh
#
DISTRIB_DESCRIPTION=$(cat /etc/centos-release)

#change 'CentOS' to something else, if you want to name your server or display a phrase
DISPLAYNAME=CentOS
LOLCAT=/usr/local/bin/lolcat

figlet $DISPLAYNAME -c | $LOLCAT -f
printf "\n"

printf "\t%s \tKernel: %s\n" "$DISTRIB_DESCRIPTION" "$(uname -r)"
printf "\n"

#System date
date=`date`

#System load
LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`

#System uptime
uptime=`cat /proc/uptime | cut -f1 -d.`
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
upSecs=$((uptime%60))

#Root fs info
root_usage=`df -h / | awk '/\// {print $4}'|grep -v "^$"`

#Memory Usage
memory_usage=`free -m | awk '/Mem:/ { total=$2 } /buffers\/cache/ { used=$3 } END { printf("%3.1f%%", used/total*100)}'`
swap_usage=`free -m | awk '/Swap/ { printf("%3.1f%%", $3/$2*100) }'`

#Users
users=`users | wc -w`

#Processes
processes=`ps aux | wc -l`

printf "\tSystem information as of: $date"

echo
echo

printf "\tSystem Load:\t%s %s %s\tSystem Uptime:\t\t%s "days" %s "hours" %s "min" %s "sec"\n" $LOAD1, $LOAD5, $LOAD15 $upDays $upHours $upMins $upSecs
printf "\tMemory Usage:\t%s\t\t\tSwap Usage:\t\t%s\n" $memory_usage $swap_usage
printf "\tUsage:\t\t%s\t\t\tSFTP Accounts:\t\t%s\n" $root_usage $users
printf "\tProcesses:\t%s\t\t\t\n" $processes

echo
echo

#include the updater; sourced from update-check.sh
source /etc/update-motd.d/90-updates-available
echo
