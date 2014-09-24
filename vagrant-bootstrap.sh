#!/usr/bin/env bash

apt-get update
apt-get -y install software-properties-common python-software-properties git build-essential
apt-get -y install gcc-arm-none-eabi gdb-arm-none-eabi binutils-arm-none-eabi openocd
mkdir /tp
chown vagrant /tp
git clone https://gitorious.org/uc-sdk/uc-sdk.git /tp/uC-sdk
wget http://thomaspietrzak.com/enseignement/NIHM/Makefile -O /tp/Makefile
wget http://thomaspietrzak.com/enseignement/NIHM/test.c -O /tp/test.c
echo "The dev environment is at /tp"

# Configure sshd for X11 forwarding
if [[ ! -f /.sshd-x11-forward-done ]]; then
	echo "X11Forwarding yes" >>/etc/ssh/sshd_config
	echo "X11UseLocalhost no" >>/etc/ssh/sshd_config
	touch /.sshd-x11-forward-done
	echo "You should now reboot the virtual machine to enable X11 forwarding."
fi

