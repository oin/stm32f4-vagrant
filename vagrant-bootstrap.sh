#!/usr/bin/env bash

pacman -Sy --noconfirm --needed base-devel arm-none-eabi-gcc arm-none-eabi-gdb arm-none-eabi-binutils
pacman -Sy --noconfirm --needed openocd
git clone git@gitorious.org:uc-sdk/uc-sdk.git
ln -s uc-sdk uC-sdk

# Configure sshd for X11 forwarding
if [[ ! -f /.sshd-x11-forward-done ]]; then
	echo "X11Forwarding yes" >>/etc/ssh/sshd_config
	echo "X11UseLocalhost no" >>/etc/ssh/sshd_config
	touch /.sshd-x11-forward-done
	echo "You should now reboot the virtual machine to enable X11 forwarding."
fi

