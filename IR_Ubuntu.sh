#! /bin/bash

echo "************************************************************"
echo "Automate Data Collection for Ubuntu Server Script v2.0"
echo "************************************************************"

# Read Current Directory
curr=${PWD}

# Create Directory :
mkdir -p $curr/UbuntuIR

# Sesuaikan Directory
dir=$curr/UbuntuIR

# Identifikasi Date & Uptime
date > $dir/0.DateTime.txt
uptime > $dir/0.Uptime.txt

# Identifikasi Versi Environment System
uname -a > $dir/1.Versi_Kernel.txt
cat /etc/lsb-release > $dir/2.Versi_OS.txt
lsb_release -a 2>/dev/null >> $dir/2.Versi_OS.txt
cat /etc/os-release > $dir/2b.OS-Release.txt

# Identifikasi Aplikasi/Service & Packages
ps -aux > $dir/3.Daftar_Proses.txt
top -b -n 1 > $dir/4.Daftar_Running_App.txt
ls -la /etc/rc?.d/ > $dir/4b.Startup-Services.txt
systemctl list-units --type=service > $dir/4c.Active-Services.txt
dpkg -l > $dir/4d.Packages.txt
snap list > $dir/4e.Snap-Packages.txt
cat /root/.bash_history > $dir/5.History.txt
ls /etc/cron* > $dir/6.Cron.txt
crontab -l > $dir/7.Crontab.txt
lsof -i > $dir/7b.Open-Files.txt

# Identifikasi Jaring Komunikasi
netstat -tulnp > $dir/8.Inbound.txt
netstat -antup > $dir/9.Outbound.txt
netstat -antup | grep "ESTA" > $dir/10.Established_Conn.txt
w > $dir/11.Connected_to_PC.txt
cat /etc/resolv.conf > $dir/12.DNS.txt
cat /etc/hostname > $dir/13.Hostname.txt
cat /etc/hosts > $dir/14.Hosts.txt
ifconfig > $dir/14b.Network-Interfaces.txt
ip a > $dir/14c.IP-Address.txt
arp -a > $dir/14d.ARP-Table.txt
iptables -L -n -v > $dir/14e.Iptables-Rules.txt
ufw status verbose > $dir/14f.UFW-Status.txt

# Identifikasi User
cat /etc/passwd > $dir/15.Daftar_User.txt
cat /etc/passwd | grep "bash" > $dir/16.Daftar_User_Bash.txt
cat /etc/sudoers > $dir/16b.Sudoers.txt
getent group sudo > $dir/16c.Sudo-Group-Members.txt
lastlog > $dir/17.Lastlog.txt
last > $dir/18.Last.txt

# List Directory & File Integrity
ls -alrt -R /home > $dir/19.Homedir.txt
ls -alrt -R /var/www > $dir/20.VarWWWdir.txt
find / -perm /6000 -type f -exec ls -al {} \; > $dir/20b.SUID-SGID-Files.txt 2>/dev/null
find / -mtime -7 -type f -ls > $dir/20c.Recent-Modified-Files.txt 2>/dev/null

# Log Files
ls -al /var/log/ > $dir/23.Log-Directory-Listing.txt
cp -a /var/log/auth.log $dir/23b.Auth-Log.txt
cp -a /var/log/syslog $dir/23c.Syslog.txt
cp -a /var/log/dmesg $dir/23d.Dmesg-Log.txt
cp -a /var/log/apt/history.log $dir/23e.AP-History.txt

# Searching Backdoor File
echo "Start Searching..."
grep -RPn "(passthru|shell_exec|system|phpinfo|base64_decode|chmod|mkdir|fopen|fclose|fclose|readfile) *\(" /home/ > $dir/21.Backdoor-Homedir.txt
grep -RPn "(passthru|shell_exec|system|phpinfo|base64_decode|chmod|mkdir|fopen|fclose|fclose|readfile) *\(" /var/www/ > $dir/22.Backdoor-VarWWWdir.txt
echo "Finish Searching.\n"

# Create Compressed File
tar -czf Collection.tar.gz UbuntuIR
rm -rf UbuntuIR

echo "************************************************************"
echo "Script Completed Succesfully, saved to ./Collection.tar.gz"
echo "************************************************************"
