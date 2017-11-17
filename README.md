# Ubuntu-like Message of the Day for CentOS
 / ___|___ _ __ | |_ / _ \/ ___| 
| |   / _ \ '_ \| __| | | \___ \ 
| |__|  __/ | | | |_| |_| |___) |
 \____\___|_| |_|\__|\___/|____/ 
                                 

	CentOS Linux release 7.4.1708 (Core)  	Kernel: 3.10.0-693.2.2.el7.x86_64

	System information as of: Fri Nov 17 12:54:05 CST 2017

	System Load:	0.09, 0.04, 0.05	System Uptime:		24 days 23 hours 45 min 9 sec
	Memory Usage:	0.0%			Swap Usage:		2.3%
	Usage:		15G			SFTP Accounts:		1
	Processes:	82			


  System is up to date



Auto-check for updates and have them emailed, with a useless stylized & colored figlet screen - just because.
The script assumes you have `lolcat` and `figlet` packages installed.  If not, proceed with the directions below.

(Will also work on other Redhat-based systems like Fedora and deriatives)

**Install dependencies**
```
yum install rubygems
gem install lolcat
```

**mimic the ubuntu setup**
```
mkdir /etc/update-motd.d/
```

**place the scripts in your preferred directory, ex: /var/motd/**

**make the update script executable**
```
hmod +x /path/to/update-check.sh
```

**edit the profile to assign a motd**
```
nano /etc/profile
```

**add to bottom of /etc/profile:**
```
/path/to/motd.sh
```

**add a cron as root**
```
crontab -e
```

**set your desired time for the update script to run**
```
28 2 * * * /path/to/update-check.sh
```

Done.
