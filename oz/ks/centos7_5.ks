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
timezone --utc Asia/Shanghai
bootloader --location=mbr --append="console=tty0 console=ttyS0,115200"

zerombr
clearpart --all 
#autopart --type=lvm
part / --fstype xfs --size=4096 --grow 

reboot

%packages
openssh-clients
@^minimal
@core
%end

%addon com_RedHat_kdump --disable --reserve-mb='auto'
%end

%post
systemctl enable acpid
sed -i 's/disable_root: .*/disable_root: 0/g' /etc/cloud/cloud.cfg
sed -i 's/ssh_pwauth: .*/ssh_pwauth: 1/g' /etc/cloud/cloud.cfg
sed -i 's/name: centos/name: root/g' /etc/cloud/cloud.cfg

%end
