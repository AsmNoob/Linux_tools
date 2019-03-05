#! /bin/bash

mkdir /opt/CTF_Tools

mkdir /opt/CTF_Tools/Audio
cd /opt/CTF_Tools/Audio
wget https://code.soundsoftware.ac.uk/attachments/download/2439/SonicVisualiser-3.2.1-x86_64.AppImage
chmod +x SonicVisualiser-3.2.1-x86_64.AppImage

mkdir /opt/CTF_Tools/Stegano
cd mkdir /opt/CTF_Tools/Stegano
wget http://www.caesum.com/handbook/Stegsolve.jar
mv Stegsolve.jar stegsolve
chmod +x stegsolve
ln -s /usr/bin/steghide /opt/CTF_Tools/Stegano/steghide
pip install hipshot
gem install zsteg
ln -s /usr/local/bin/zsteg /opt/CTF_Tools/Stegano/zsteg

mkdir /opt/CTF_Tools/Reverse
apt-get install radare2
ln -s /usr/bin/radare2 /opt/CTF_Tools/Reverse/radare2
git clone https://github.com/0xd4d/dnSpy.git /opt/CTF_Tools/Reverse/dnspy


mkdir /opt/CTF_Tools/Network
apt-get install bro
ln -s /usr/bin/bro /opt/CTF_Tools/Network/bro

mkdir /opt/CTF_Tools/PDF
apt-get install pdfdetach pdfcrack
ln -s /usr/bin/pdfdetach /opt/CTF_Tools/PDF/pdfdetach
ln -s /usr/bin/pdfcrack /opt/CTF_Tools/PDF/pdfcrack

mkdir /opt/CTF_Tools/Forensics
apt-get install scalpel foremost vinetto binwalk
ln -s /usr/bin/scalpel /opt/CTF_Tools/Forensics/scalpel
ln -s /usr/bin/foremost /opt/CTF_Tools/Forensics/foremost
ln -s /usr/bin/vinetto /opt/CTF_Tools/Forensics/vinetto
ln -s /usr/bin/binwalk /opt/CTF_Tools/Forensics/vinetto
pip install hachoir-subfile
pip install hachoir-parser
pip install hachoir-core
pip install hachoir_regex
ln -s /usr/local/bin/hachoir-subfile /opt/CTF_Tools/Forensics/hachoir-subfile

mkdir /opt/CTF_Tools/APK
git clone https://github.com/skylot/jadx.git /opt/CTF_Tools/APK/jadx
cd /opt/CTF_Tools/APK/jadx
./gradlew dist

mkdir /opt/CTF_Tools/Wi-fi
apt-get install wifite
ln -s /usr/sbin/wifite /opt/CTF_Tools/Wi-fi/wifite

apt-get install wine

git clone https://github.com/eugenekolo/sec-tools.git /opt/CTF_Tools/
cd /opt/CTF_Tools
./sec-tools/sec-tools setup && source ~/.bashrc
sec-tools install binary/apktool
sec-tools install binary/binwalk
sec-tools install binary/checksec
sec-tools install binary/dex2jar
sec-tools install binary/hxd
sec-tools install binary/idafree
sec-tools install binary/jdgui
sec-tools install binary/peda
sec-tools install binary/preeny
sec-tools install binary/qemu
sec-tools install binary/qira
sec-tools install binary/radare2
sec-tools install binary/ropgadget
sec-tools install binary/upx
sec-tools install crypto/aeskeyfind
sec-tools install crypto/cribdrag
sec-tools install crypto/evilize
sec-tools install crypto/foresight
sec-tools install crypto/hashid
sec-tools install crypto/msieve
sec-tools install crypto/padbuster
sec-tools install crypto/pkcrack
sec-tools install crypto/python-paddingoracle
sec-tools install crypto/ssh_decoder
sec-tools install crypto/yafu
sec-tools install crypto/xortool
sec-tools install fuzzers/afl
sec-tools install fuzzers/pathgrind
sec-tools install stego/ElectronicColoringBook
sec-tools install stego/exiftool
sec-tools install stego/lsbsteg
sec-tools install stego/poppler
sec-tools install stego/steganabara
sec-tools install stego/stegdetect
sec-tools install stego/stegsolve
sec-tools install tools/brakeman
sec-tools install tools/bruteforce
sec-tools install tools/entropy
sec-tools install tools/extundelete
sec-tools install tools/pngtools
sec-tools install tools/pyunpack
sec-tools install tools/shoe
sec-tools install tools/swftools
sec-tools install tools/wordlist
sec-tools install web/burpsuite
sec-tools install web/dirsearch
sec-tools install web/hashpump
sec-tools install web/mitmproxy
sec-tools install web/net-creds
sec-tools install web/sqlmap
