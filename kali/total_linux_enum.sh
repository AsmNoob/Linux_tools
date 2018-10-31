#!/bin/bash
echo "============================="
echo "         Version"
echo "============================="
cat /etc/issue 2>/dev/null > version.txt
cat /etc/*-release 2>/dev/null > version.txt
cat /etc/lsb-release 2>/dev/null > version.txt
cat /etc/redhat-release 2>/dev/null > version.txt
echo "============================="

echo "============================="
echo "          Kernel"
echo "============================="

cat /proc/version 2>/dev/null > kernel.txt
uname -a 2>/dev/null > kernel.txt
uname -mrs 2>/dev/null > kernel.txt
rpm -q kernel 2>/dev/null > kernel.txt
dmesg | grep Linux 2>/dev/null > kernel.txt
ls /boot | grep vmlinuz- 2>/dev/null > kernel.txt

echo "============================="
echo "          Environment"
echo "============================="

cat /etc/profile 2>/dev/null > env.txt
cat /etc/bashrc 2>/dev/null > env.txt
cat ~/.bash_profile 2>/dev/null > env.txt
cat ~/.bashrc 2>/dev/null > env.txt
cat ~/.bash_logout 2>/dev/null > env.txt
env 2>/dev/null > env.txt
set 2>/dev/null > env.txt

echo "============================="
echo "          printer"
echo "============================="

lpstat -a 2>/dev/null > printer.txt

echo "============================="
echo "          Services"
echo "============================="

ps aux 2>/dev/null > services.txt
ps -ef 2>/dev/null > services.txt
# top 2>/dev/null > services.txt
cat /etc/services 2>/dev/null > services.txt

echo "============================="
echo "          Root services"
echo "============================="

ps aux | grep root 2>/dev/null > root_services.txt
ps -ef | grep root 2>/dev/null > root_services.txt

echo "============================="
echo "          Apps installed"
echo "============================="

ls -alh /usr/bin/ 2>/dev/null > apps.txt
ls -alh /sbin/ 2>/dev/null > apps.txt
dpkg -l 2>/dev/null > apps.txt
rpm -qa 2>/dev/null > apps.txt
ls -alh /var/cache/apt/archivesO 2>/dev/null > apps.txt
ls -alh /var/cache/yum/ 2>/dev/null > apps.txt

echo "============================="
echo "          Misconfigs"
echo "============================="

cat /etc/syslog.conf 2>/dev/null > misc.txt
cat /etc/chttp.conf 2>/dev/null > misc.txt
cat /etc/lighttpd.conf 2>/dev/null > misc.txt
cat /etc/cups/cupsd.conf 2>/dev/null > misc.txt
cat /etc/inetd.conf 2>/dev/null > misc.txt
cat /etc/apache2/apache2.conf 2>/dev/null > misc.txt
cat /etc/my.conf 2>/dev/null > misc.txt
cat /etc/httpd/conf/httpd.conf 2>/dev/null > misc.txt
cat /opt/lampp/etc/httpd.conf 2>/dev/null > misc.txt
ls -aRl /etc/ | awk '$1 ~ /^.*r.*/' 2>/dev/null > misc.txt

echo "============================="
echo "          Scheduled jobs"
echo "============================="

crontab -l > jobs.txt
ls -alh /var/spool/cron 2>/dev/null > jobs.txt
ls -al /etc/ | grep cron 2>/dev/null > jobs.txt
ls -al /etc/cron* 2>/dev/null > jobs.txt
cat /etc/cron* 2>/dev/null > jobs.txt
cat /etc/at.allow 2>/dev/null > jobs.txt
cat /etc/at.deny 2>/dev/null > jobs.txt
cat /etc/cron.allow 2>/dev/null > jobs.txt
cat /etc/cron.deny 2>/dev/null > jobs.txt
cat /etc/crontab 2>/dev/null > jobs.txt
cat /etc/anacrontab 2>/dev/null > jobs.txt
cat /var/spool/cron/crontabs/root 2>/dev/null > jobs.txt

echo "============================="
echo "          Network"
echo "============================="

/sbin/ifconfig -a 2>/dev/null > net.txt
cat /etc/network/interfaces 2>/dev/null > net.txt
cat /etc/sysconfig/network 2>/dev/null > net.txt

echo "============================="
echo "          Network config"
echo "============================="

cat /etc/resolv.conf 2>/dev/null > net_conf.txt
cat /etc/sysconfig/network 2>/dev/null > net_conf.txt
cat /etc/networks 2>/dev/null > net_conf.txt
iptables -L 2>/dev/null > net_conf.txt
hostname 2>/dev/null > net_conf.txt
dnsdomainname 2>/dev/null > net_conf.txt

echo "============================="
echo "          Communications"
echo "============================="

#lsof -i 2>/dev/null > communications.txt
#lsof -i :80 2>/dev/null > communications.txt
grep 80 /etc/services 2>/dev/null > communications.txt
netstat -antup 2>/dev/null > communications.txt
netstat -antpx 2>/dev/null > communications.txt
netstat -tulpn 2>/dev/null > communications.txt
chkconfig --list 2>/dev/null > communications.txt
#chkconfig --list | grep 3:on 2>/dev/null > communications.txt
last 2>/dev/null > communications.txt
w 2>/dev/null > communications.txt

echo "============================="
echo "          Cached IP MAC"
echo "============================="

# arp -e 2>/dev/null > cached_ip_mac.txt
# route 2>/dev/null > cached_ip_mac.txt
# /sbin/route -nee 2>/dev/null > cached_ip_mac.txt

echo "============================="
echo "          User information"
echo "============================="

id 2>/dev/null > users.txt
who 2>/dev/null > users.txt
w 2>/dev/null > users.txt
last 2>/dev/null > users.txt
echo "------- users --------" > users.txt
cat /etc/passwd | cut -d: -f1 > users.txt
echo  "------ super users --------" > users.txt
grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1}'    > users.txt
awk -F: '($3 == "0") {print}' /etc/passwd   > users.txt
cat /etc/sudoers 2>/dev/null > users.txt
sudo -l 2>/dev/null > users.txt

echo "============================="
echo "          Sensitive files"
echo "============================="

cat /etc/passwd 2>/dev/null > sensitive.txt
cat /etc/group 2>/dev/null > sensitive.txt
cat /etc/shadow 2>/dev/null > sensitive.txt
ls -alh /var/mail/ 2>/dev/null > sensitive.txt

echo "============================="
echo "          Interesting directories"
echo "============================="

ls -ahlR /root/ 2>/dev/null > dirs.txt
ls -ahlR /home/ 2>/dev/null > dirs.txt

echo "============================="
echo "          Passwordds ?"
echo "============================="

cat /var/apache2/config.inc 2>/dev/null > pass.txt
cat /var/lib/mysql/mysql/user.MYD 2>/dev/null > pass.txt
cat /root/anaconda-ks.cfg 2>/dev/null > pass.txt

echo "============================="
echo "          History"
echo "============================="

cat ~/.bash_history 2>/dev/null > hist.txt
cat ~/.nano_history 2>/dev/null > hist.txt
cat ~/.atftp_history 2>/dev/null > hist.txt
cat ~/.mysql_history 2>/dev/null > hist.txt
cat ~/.php_history 2>/dev/null > hist.txt

echo "============================="
echo "          User information"
echo "============================="

cat ~/.bashrc 2>/dev/null > more_user.txt
cat ~/.profile 2>/dev/null > more_user.txt
cat /var/mail/root 2>/dev/null > more_user.txt
cat /var/spool/mail/root 2>/dev/null > more_user.txt

echo "============================="
echo "          Private Keys"
echo "============================="

cat ~/.ssh/authorized_keys 2>/dev/null > keys.txt
cat ~/.ssh/identity.pub 2>/dev/null > keys.txt
cat ~/.ssh/identity 2>/dev/null > keys.txt
cat ~/.ssh/id_rsa.pub 2>/dev/null > keys.txt
cat ~/.ssh/id_rsa 2>/dev/null > keys.txt
cat ~/.ssh/id_dsa.pub 2>/dev/null > keys.txt
cat ~/.ssh/id_dsa 2>/dev/null > keys.txt
cat /etc/ssh/ssh_config 2>/dev/null > keys.txt
cat /etc/ssh/sshd_config 2>/dev/null > keys.txt
cat /etc/ssh/ssh_host_dsa_key.pub 2>/dev/null > keys.txt
cat /etc/ssh/ssh_host_dsa_key 2>/dev/null > keys.txt
cat /etc/ssh/ssh_host_rsa_key.pub 2>/dev/null > keys.txt
cat /etc/ssh/ssh_host_rsa_key 2>/dev/null > keys.txt
cat /etc/ssh/ssh_host_key.pub 2>/dev/null > keys.txt
cat /etc/ssh/ssh_host_key 2>/dev/null > keys.txt

echo "============================="
echo "          File system"
echo "============================="

ls -aRl /etc/ | awk '$1 ~ /^.*w.*/' 2>/dev/null > file_system.txt
ls -aRl /etc/ | awk '$1 ~ /^..w/' 2>/dev/null > file_system.txt
ls -aRl /etc/ | awk '$1 ~ /^.....w/' 2>/dev/null > file_system.txt
ls -aRl /etc/ | awk '$1 ~ /w.$/' 2>/dev/null > file_system.txt

find /etc/ -readable -type f 2>/dev/null > file_system.txt
find /etc/ -readable -type f -maxdepth 1 2>/dev/null > file_system.txt

echo "============================="
echo "          VAR"
echo "============================="

ls -alh /var/log 2>/dev/null > var.txt
ls -alh /var/mail 2>/dev/null > var.txt
ls -alh /var/spool 2>/dev/null > var.txt
ls -alh /var/spool/lpd 2>/dev/null > var.txt
ls -alh /var/lib/pgsql 2>/dev/null > var.txt
ls -alh /var/lib/mysql 2>/dev/null > var.txt
cat /var/lib/dhcp3/dhclient.leases 2>/dev/null > var.txt

echo "============================="
echo "          Hidden web stuff"
echo "============================="

ls -alhR /var/www/ 2>/dev/null > hidden_web.txt
ls -alhR /srv/www/htdocs/ 2>/dev/null > hidden_web.txt
ls -alhR /usr/local/www/apache22/data/ 2>/dev/null > hidden_web.txt
ls -alhR /opt/lampp/htdocs/ 2>/dev/null > hidden_web.txt
ls -alhR /var/www/html/ 2>/dev/null > hidden_web.txt

echo "============================="
echo "          Logs"
echo "============================="

cat /etc/httpd/logs/access_log 2>/dev/null > logs.txt
cat /etc/httpd/logs/access.log 2>/dev/null > logs.txt
cat /etc/httpd/logs/error_log 2>/dev/null > logs.txt
cat /etc/httpd/logs/error.log 2>/dev/null > logs.txt
cat /var/log/apache2/access_log 2>/dev/null > logs.txt
cat /var/log/apache2/access.log 2>/dev/null > logs.txt
cat /var/log/apache2/error_log 2>/dev/null > logs.txt
cat /var/log/apache2/error.log 2>/dev/null > logs.txt
cat /var/log/apache/access_log 2>/dev/null > logs.txt
cat /var/log/apache/access.log 2>/dev/null > logs.txt
cat /var/log/auth.log 2>/dev/null > logs.txt
cat /var/log/chttp.log 2>/dev/null > logs.txt
cat /var/log/cups/error_log 2>/dev/null > logs.txt
cat /var/log/dpkg.log 2>/dev/null > logs.txt
cat /var/log/faillog 2>/dev/null > logs.txt
cat /var/log/httpd/access_log 2>/dev/null > logs.txt
cat /var/log/httpd/access.log 2>/dev/null > logs.txt
cat /var/log/httpd/error_log 2>/dev/null > logs.txt
cat /var/log/httpd/error.log 2>/dev/null > logs.txt
cat /var/log/lastlog 2>/dev/null > logs.txt
cat /var/log/lighttpd/access.log 2>/dev/null > logs.txt
cat /var/log/lighttpd/error.log 2>/dev/null > logs.txt
cat /var/log/lighttpd/lighttpd.access.log 2>/dev/null > logs.txt
cat /var/log/lighttpd/lighttpd.error.log 2>/dev/null > logs.txt
cat /var/log/messages 2>/dev/null > logs.txt
cat /var/log/secure 2>/dev/null > logs.txt
cat /var/log/syslog 2>/dev/null > logs.txt
cat /var/log/wtmp 2>/dev/null > logs.txt
cat /var/log/xferlog 2>/dev/null > logs.txt
cat /var/log/yum.log 2>/dev/null > logs.txt
cat /var/run/utmp 2>/dev/null > logs.txt
cat /var/webmin/miniserv.log 2>/dev/null > logs.txt
cat /var/www/logs/access_log 2>/dev/null > logs.txt
cat /var/www/logs/access.log 2>/dev/null > logs.txt
ls -alh /var/lib/dhcp3/ 2>/dev/null > logs.txt
ls -alh /var/log/postgresql/ 2>/dev/null > logs.txt
ls -alh /var/log/proftpd/ 2>/dev/null > logs.txt
ls -alh /var/log/samba/ 2>/dev/null > logs.txt

echo "============================="
echo "          Linux perm"
echo "============================="
echo "------ ticky bit -----------"
find / -perm -1000 -type d 2>/dev/null   # Sticky bit - Only the owner of the directory or the owner of a file can delete or rename here.
echo "------ run as group ------------"
find / -perm -g=s -type f 2>/dev/null    # SGID (chmod 2000) - run as the group, not the user who started it.
echo "------ run as owner -----------"
find / -perm -u=s -type f 2>/dev/null    # SUID (chmod 4000) - run as the owner, not the user who started it.
echo "------ sgid - suid -----------"
find / -perm -g=s -o -perm -u=s -type f 2>/dev/null    # SGID or SUID
for i in `locate -r "bin$"`; do find $i \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null; done    # Looks in 'common' places: /bin, /sbin, /usr/bin, /usr/sbin, /usr/local/bin, /usr/local/sbin and any other *bin, for SGID or SUID (Quicker search)

# find starting at root (/), SGID or SUID, not Symbolic links, only 3 folders deep, list with more detail and hide any errors (e.g. permission denied)
find / -perm -g=s -o -perm -4000 ! -type l -maxdepth 3 -exec ls -ld {} \; 2>/dev/null

echo "============================="
echo "          Write and execute Files"
echo "============================="

find / -writable -type d 2>/dev/null      # world-writeable folders
find / -perm -222 -type d 2>/dev/null     # world-writeable folders
find / -perm -o w -type d 2>/dev/null     # world-writeable folders

find / -perm -o x -type d 2>/dev/null     # world-executable folders

find / \( -perm -o w -perm -o x \) -type d 2>/dev/null   # world-writeable & executable folders

echo "============================="
echo "          Problem files"
echo "============================="

find / -xdev -type d \( -perm -0002 -a ! -perm -1000 \) -print   # world-writeable files
# find /dir -xdev \( -nouser -o -nogroup \) -print

echo "============================="
echo "          Pre-exploit tools"
echo "============================="

find / -name perl* > tools.txt
find / -name python* > tools.txt
find / -name gcc* > tools.txt
find / -name cc > tools.txt


find / -name wget > tools.txt
find / -name nc* > tools.txt
find / -name netcat* > tools.txt
find / -name tftp* > tools.txt
find / -name ftp > tools.txt