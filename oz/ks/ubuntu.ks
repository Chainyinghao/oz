d-i debian-installer/locale string en_US
d-i console-setup/ask_detect boolean false
d-i console-setup/layoutcode string us
 
d-i netcfg/choose_interface select auto
d-i netcfg/get_hostname string unassigned-hostname
d-i netcfg/get_domain string unassigned-domain
d-i netcfg/wireless_wep string
 
d-i clock-setup/utc boolean true
d-i time/zone string Asia/Shanghai
 
d-i partman-auto/disk string /dev/vda
d-i partman-auto/method string regular
d-i partman-auto/expert_recipe string root :: 2048 50 5120 ext4 \
        $primary{ } $bootable{ } method{ format } \
        format{ } use_filesystem{ } filesystem{ ext4 } \
        mountpoint{ / } \
    .
d-i partman-auto/choose_recipe select root
d-i partman-auto/confirm boolean true
d-i partman-partitioning/confirm_write_new_label boolean true
d-i partman/choose_partition select Finish partitioning and write changes to disk
d-i partman/confirm boolean true
d-i partman/confirm_nooverwrite boolean true
d-i partman-basicfilesystems/no_swap boolean false
d-i partman-partitioning/default_label select msdos
 
d-i passwd/root-login boolean true
d-i passwd/make-user boolean false
d-i passwd/root-password password !QAZ2wsx
d-i passwd/root-password-again password !QAZ2wsx
 
tasksel tasksel/first multiselect standard
d-i pkgsel/include/install-recommends boolean true
d-i pkgsel/include string openssh-clients curl
 
d-i grub-installer/only_debian boolean true
d-i grub-installer/with_other_os boolean true
 
d-i apt-setup/security_host string
base-config apt-setup/security-updates boolean false
 
ubiquity ubiquity/summary note
ubiquity ubiquity/reboot boolean true
 
d-i finish-install/reboot_in_progress note

