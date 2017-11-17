# Ubuntu-like Message of the Day for CentOS
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
