This is a development environment (based on Ubuntu 14.04) for a STM32F4 board, following [Thomas' TP](http://thomaspietrzak.com/enseignement/NIHM/tphardware.html).

# Installation instructions

1. Install Virtualbox.

2. Install Vagrant.

3. Clone this repo:

	$ git clone https://github.com/oin/stm32f4-vagrant.git

4. Launch the virtual machine:

	$ cd stm32f4-vagrant
	$ vagrant up

# Ubuntu 14.04 instructions

 * Vagrant version in the repository is old, thus you should use the vagrant .deb provided [here](https://www.vagrantup.com/downloads)

 * If you don't know how to install .deb packages :
  * remove the old one : `sudo apt-get remove vagrant`
  * open the .deb with ubuntu software center and install it

 * You should add your user to the `vboxusers` group to access the USB with the vagrant image: `sudo usermod -aG vboxusers <your username>`

# Usage

Log into the virtual machine:

	$ vagrant ssh
	(logging in...)
	vagrant$ cd /tp
	vagrant$ make

Make sure openocd runs in the background:

	vagrant$ sudo openocd -f board/stm32f4discovery.cfg

Now edit `src/test.c` with whatever you want and make in the virtual machine.
You'll be able to load the program and debug using gdb:

	vagrant$ arm-none-eabi-gdb -ex "target extended-remote :3333" src/test.elf

To reload the program, use:

	(gdb) monitor reset halt
	(gdb) load
	(gdb) continue

Thus, you will need 3 ssh open (with `vagrant ssh`). If you don't want this, you can use byobu (installed in the image) : 
 * `vagrant ssh` to log in the box
 * `byobu` to create a new byobu session
 * `Ctrl-a n` to create a new window
 * `F8` to rename current window
 * `Ctrl-a i` to go the window `i`

To stop playing, quit gdb, openocd, and halt the virtual machine in the host.

	$ vagrant halt

