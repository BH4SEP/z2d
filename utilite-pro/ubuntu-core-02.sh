#!/bin/sh
. ./common-functions.sh

export DEBIAN_FRONTEND=noninteractive

c_locale "en_GB.UTF-8" "de_DE.UTF-8"
c_tzone "Europe/Berlin"
c_hostname "upro"
c_apt_list "xenial"
c_nameserver "8.8.8.8"

dpkg-divert --local --rename --add /sbin/initctl; ln -s /bin/true /sbin/initctl

r_pkg_upgrade
i_base
i_extra
i_kernel_utilite_pro
c_if_lo
c_if_dhcp "eth0"
c_ttyS "ttymxc3"
c_fw_utils "/dev/mtd1  0x0  0x2000  0x2000"
c_user "ubuntu"

apt-get clean

rm /sbin/initctl; dpkg-divert --local --rename --remove /sbin/initctl
