#!/bin/bash
echo "============================="
echo "         Version"
echo "============================="
cat /etc/issue 2>/dev/null
cat /etc/*-release 2>/dev/null
cat /etc/lsb-release2>/dev/null
cat /etc/redhat-release 2>/dev/null
echo "============================="

echo "============================="
echo "          Kernel"
echo "============================="

cat /proc/version 2>/dev/null
uname -a 2>/dev/null
uname -mrs 2>/dev/null
rpm -q kernel 2>/dev/null
dmesg | grep Linux 2>/dev/null
ls /boot | grep vmlinuz- 2>/dev/null

echo "============================="
echo "          Environment"
echo "============================="

cat /etc/profile 2>/dev/null
cat /etc/bashrc 2>/dev/null
cat ~/.bash_profile 2>/dev/null
cat ~/.bashrc 2>/dev/null
cat ~/.bash_logout 2>/dev/null
env 2>/dev/null
set 2>/dev/null

echo "============================="
echo "          printer"
echo "============================="

lpstat -a 2>/dev/null

echo "============================="
echo "          Services"
echo "============================="

ps aux 2>/dev/null
ps -ef 2>/dev/null
top 2>/dev/null
cat /etc/services 2>/dev/null

echo "============================="
echo "          Root services"
echo "============================="

ps aux | grep root 2>/dev/null
ps -ef | grep root 2>/dev/null

echo "============================="
echo "          Apps installed"
echo "============================="

ls -alh /usr/bin/ 2>/dev/null
ls -alh /sbin/ 2>/dev/null
dpkg -l 2>/dev/null
rpm -qa 2>/dev/null
ls -alh /var/cache/apt/archivesO 2>/dev/null
ls -alh /var/cache/yum/ 2>/dev/null

echo "============================="
echo "          Misconfigs"
echo "============================="

cat /etc/syslog.conf 2>/dev/null
cat /etc/chttp.conf 2>/dev/null
cat /etc/lighttpd.conf 2>/dev/null
cat /etc/cups/cupsd.conf 2>/dev/null
cat /etc/inetd.conf 2>/dev/null
cat /etc/apache2/apache2.conf 2>/dev/null
cat /etc/my.conf 2>/dev/null
cat /etc/httpd/conf/httpd.conf 2>/dev/null
cat /opt/lampp/etc/httpd.conf 2>/dev/null
ls -aRl /etc/ | awk '$1 ~ /^.*r.*/ 2>/dev/null

echo "============================="
echo "          Scheduled jobs"
echo "============================="

crontab -l
ls -alh /var/spool/cron 2>/dev/null
ls -al /etc/ | grep cron 2>/dev/null
ls -al /etc/cron* 2>/dev/null
cat /etc/cron* 2>/dev/null
cat /etc/at.allow 2>/dev/null
cat /etc/at.deny 2>/dev/null
cat /etc/cron.allow 2>/dev/null
cat /etc/cron.deny 2>/dev/null
cat /etc/crontab 2>/dev/null
cat /etc/anacrontab 2>/dev/null
cat /var/spool/cron/crontabs/root 2>/dev/null

echo "============================="
echo "          Network"
echo "============================="

/sbin/ifconfig -a 2>/dev/null
cat /etc/network/interfaces 2>/dev/null
cat /etc/sysconfig/network 2>/dev/null

echo "============================="
echo "          Network config"
echo "============================="

cat /etc/resolv.conf 2>/dev/null
cat /etc/sysconfig/network 2>/dev/null
cat /etc/networks 2>/dev/null
iptables -L 2>/dev/null
hostname 2>/dev/null
dnsdomainname 2>/dev/null

echo "============================="
echo "          Communications"
echo "============================="

lsof -i 2>/dev/null
lsof -i :80 2>/dev/null
grep 80 /etc/services 2>/dev/null
netstat -antup 2>/dev/null
netstat -antpx 2>/dev/null
netstat -tulpn 2>/dev/null
chkconfig --list 2>/dev/null
chkconfig --list | grep 3:on 2>/dev/null
last 2>/dev/null
w 2>/dev/null

echo "============================="
echo "          Cached IP MAC"
echo "============================="

arp -e 2>/dev/null
route 2>/dev/null
/sbin/route -nee 2>/dev/null

echo "============================="
echo "          User information"
echo "============================="

id 2>/dev/null
who 2>/dev/null
w 2>/dev/null
last 2>/dev/null
cat /etc/passwd | cut -d: -f1    # List of users 2>/dev/null
grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1}'   # List of super users 2>/dev/null
awk -F: '($3 == "0") {print}' /etc/passwd   # List of super users 2>/dev/null
cat /etc/sudoers 2>/dev/null
sudo -l 2>/dev/null

echo "============================="
echo "          Sensitive files"
echo "============================="

cat /etc/passwd 2>/dev/null
cat /etc/group 2>/dev/null
cat /etc/shadow 2>/dev/null
ls -alh /var/mail/ 2>/dev/null

echo "============================="
echo "          Interesting directories"
echo "============================="

ls -ahlR /root/ 2>/dev/null
ls -ahlR /home/ 2>/dev/null

echo "============================="
echo "          Passwordds ?"
echo "============================="

cat /var/apache2/config.inc 2>/dev/null
cat /var/lib/mysql/mysql/user.MYD 2>/dev/null
cat /root/anaconda-ks.cfg 2>/dev/null

echo "============================="
echo "          History"
echo "============================="

cat ~/.bash_history 2>/dev/null
cat ~/.nano_history 2>/dev/null
cat ~/.atftp_history 2>/dev/null
cat ~/.mysql_history 2>/dev/null
cat ~/.php_history 2>/dev/null

echo "============================="
echo "          User information"
echo "============================="

cat ~/.bashrc 2>/dev/null
cat ~/.profile 2>/dev/null
cat /var/mail/root 2>/dev/null
cat /var/spool/mail/root 2>/dev/null

echo "============================="
echo "          Private Keys"
echo "============================="

cat ~/.ssh/authorized_keys 2>/dev/null
cat ~/.ssh/identity.pub 2>/dev/null
cat ~/.ssh/identity 2>/dev/null
cat ~/.ssh/id_rsa.pub 2>/dev/null
cat ~/.ssh/id_rsa 2>/dev/null
cat ~/.ssh/id_dsa.pub 2>/dev/null
cat ~/.ssh/id_dsa 2>/dev/null
cat /etc/ssh/ssh_config 2>/dev/null
cat /etc/ssh/sshd_config 2>/dev/null
cat /etc/ssh/ssh_host_dsa_key.pub 2>/dev/null
cat /etc/ssh/ssh_host_dsa_key 2>/dev/null
cat /etc/ssh/ssh_host_rsa_key.pub 2>/dev/null
cat /etc/ssh/ssh_host_rsa_key 2>/dev/null
cat /etc/ssh/ssh_host_key.pub 2>/dev/null
cat /etc/ssh/ssh_host_key 2>/dev/null

echo "============================="
echo "          File system"
echo "============================="

ls -aRl /etc/ | awk '$1 ~ /^.*w.*/' 2>/dev/null     # Anyone
ls -aRl /etc/ | awk '$1 ~ /^..w/' 2>/dev/null       # Owner
ls -aRl /etc/ | awk '$1 ~ /^.....w/' 2>/dev/null    # Group
ls -aRl /etc/ | awk '$1 ~ /w.$/' 2>/dev/null        # Other

find /etc/ -readable -type f 2>/dev/null               # Anyone
find /etc/ -readable -type f -maxdepth 1 2>/dev/null   # Anyone

echo "============================="
echo "          VAR"
echo "============================="

ls -alh /var/log 2>/dev/null
ls -alh /var/mail 2>/dev/null
ls -alh /var/spool 2>/dev/null
ls -alh /var/spool/lpd 2>/dev/null
ls -alh /var/lib/pgsql 2>/dev/null
ls -alh /var/lib/mysql 2>/dev/null
cat /var/lib/dhcp3/dhclient.leases 2>/dev/null

echo "============================="
echo "          Hidden web stuff"
echo "============================="

ls -alhR /var/www/ 2>/dev/null
ls -alhR /srv/www/htdocs/ 2>/dev/null
ls -alhR /usr/local/www/apache22/data/ 2>/dev/null
ls -alhR /opt/lampp/htdocs/ 2>/dev/null
ls -alhR /var/www/html/ 2>/dev/null

echo "============================="
echo "          Logs"
echo "============================="

cat /etc/httpd/logs/access_log 2>/dev/null
cat /etc/httpd/logs/access.log 2>/dev/null
cat /etc/httpd/logs/error_log 2>/dev/null
cat /etc/httpd/logs/error.log 2>/dev/null
cat /var/log/apache2/access_log 2>/dev/null
cat /var/log/apache2/access.log 2>/dev/null
cat /var/log/apache2/error_log 2>/dev/null
cat /var/log/apache2/error.log 2>/dev/null
cat /var/log/apache/access_log 2>/dev/null
cat /var/log/apache/access.log 2>/dev/null
cat /var/log/auth.log 2>/dev/null
cat /var/log/chttp.log 2>/dev/null
cat /var/log/cups/error_log 2>/dev/null
cat /var/log/dpkg.log 2>/dev/null
cat /var/log/faillog 2>/dev/null
cat /var/log/httpd/access_log 2>/dev/null
cat /var/log/httpd/access.log 2>/dev/null
cat /var/log/httpd/error_log 2>/dev/null
cat /var/log/httpd/error.log 2>/dev/null
cat /var/log/lastlog 2>/dev/null
cat /var/log/lighttpd/access.log 2>/dev/null
cat /var/log/lighttpd/error.log 2>/dev/null
cat /var/log/lighttpd/lighttpd.access.log 2>/dev/null
cat /var/log/lighttpd/lighttpd.error.log 2>/dev/null
cat /var/log/messages 2>/dev/null
cat /var/log/secure 2>/dev/null
cat /var/log/syslog 2>/dev/null
cat /var/log/wtmp 2>/dev/null
cat /var/log/xferlog 2>/dev/null
cat /var/log/yum.log 2>/dev/null
cat /var/run/utmp 2>/dev/null
cat /var/webmin/miniserv.log 2>/dev/null
cat /var/www/logs/access_log 2>/dev/null
cat /var/www/logs/access.log 2>/dev/null
ls -alh /var/lib/dhcp3/ 2>/dev/null
ls -alh /var/log/postgresql/ 2>/dev/null
ls -alh /var/log/proftpd/ 2>/dev/null
ls -alh /var/log/samba/ 2>/dev/null

echo "============================="
echo "          Linux perm"
echo "============================="

find / -perm -1000 -type d 2>/dev/null   # Sticky bit - Only the owner of the directory or the owner of a file can delete or rename here.
find / -perm -g=s -type f 2>/dev/null    # SGID (chmod 2000) - run as the group, not the user who started it.
find / -perm -u=s -type f 2>/dev/null    # SUID (chmod 4000) - run as the owner, not the user who started it.
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
find /dir -xdev \( -nouser -o -nogroup \) -print

echo "============================="
echo "          Pre-exploit tools"
echo "============================="

find / -name perl*
find / -name python*
find / -name gcc*
find / -name cc


find / -name wget
find / -name nc*
find / -name netcat*
find / -name tftp*
find / -name ftp