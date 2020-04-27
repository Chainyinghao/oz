install
text
keyboard us
lang en_US.UTF-8
skipx
network --device eth0 --bootproto dhcp
rootpw !QAZ2wsx
firewall --disabled
authconfig --enableshadow --enablemd5
selinux --disabled
services --disabled="kdump"
timezone --utc Asia/Shanghai
bootloader --location=mbr --append="console=tty0 console=ttyS0,115200"
zerombr
clearpart --all 
part / --fstype ext4 --size=4096 --grow 

reboot

%packages --nobase --excludedocs
openssh-clients
#@core
%end

%post
chkconfig on acpid

%end
