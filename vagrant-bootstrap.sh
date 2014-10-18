#!/usr/bin/env bash

apt-get update
apt-get -y install software-properties-common python-software-properties git build-essential
apt-get -y install gcc-arm-none-eabi gdb-arm-none-eabi binutils-arm-none-eabi openocd
apt-get -y install lolcat cowsay byobu
mkdir /tp
git clone https://gitorious.org/uc-sdk/uc-sdk.git /tp/uC-sdk

#wget http://thomaspietrzak.com/enseignement/NIHM/Makefile -O /tp/Makefile
wget https://raw.githubusercontent.com/oin/stm32f4-vagrant/master/Makefile -O /tp/Makefile
wget https://raw.githubusercontent.com/oin/stm32f4-vagrant/master/.bashrc  -O /home/vagrant/.bashrc
ln -s /vagrant/src /tp/src
chown -R vagrant /tp
chgrp -R vagrant /tp
echo "The dev environment is at /tp. The source file is /tp/src/test.c."

