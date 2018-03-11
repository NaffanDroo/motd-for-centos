# Ubuntu-like Message of the Day for CentOS
Automate checking for updates and have them emailed, with a useless stylized & colored figlet screen - just because.
Will also work on other Redhat-based systems like Fedora and deriatives.

![centos motd screenshot](https://raw.githubusercontent.com/z0m8i3/motd-for-centos/master/img/centos-motd-screenshot.png)

*Dependencies*
* figlet
* lolcat

```bash
yum install figlet
yum install rubygems
gem install lolcat
```

**Mimic the ubuntu setup**
```bash
mkdir /etc/update-motd.d/
```

**Place the following scripts in your preferred directory, ex: /home/user/motd/**
* [update-check.sh](https://github.com/z0m8i3/motd-for-centos/blob/master/update-check.sh)
* [motd.sh](https://github.com/z0m8i3/motd-for-centos/blob/master/motd.sh)

**Make the scripts executable**
```bash
cd /home/user/motd/ && chmod +x update-check.sh && chmod +x motd.sh
```

**Edit the profile to assign a motd**
```bash
nano /etc/profile
```

**Add to the bottom of /etc/profile:**
```bash
/home/motd.sh
```

**Add a cron as root, which will trigger a check for updates and cache the number of updates available**
```bash
crontab -e
```

**Set your desired time for the update script to run**
```bash
28 2 * * * /home/user/update-check.sh
```

Done.
