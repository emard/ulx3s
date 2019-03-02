
This FOSSi toolchain was developed to run under WSL Ubuntu, but should work on standard Ubuntu.

Instead of the close-source Lattice Diamond software, this toolchain allows building binary files for the ULX3S using completely open-source tools such as [yosys](https://github.com/cliffordwolf/yosys.git) and [nextpnr](https://github.com/YosysHQ/nextpnr#nextpnr-ecp5).

Adapted from [gojimmypi/ULXS3_WSL_Toolchain.sh](https://gist.github.com/gojimmypi/f96cd86b2b8595b4cf3be4baf493c5a7)


```
#!/bin/bash
WORKSPACE=~/workspace
export ULXS3_COM=/dev/ttyS8

sudo ls # pause if copy/paste password prompt

# This WSL Ubuntu bash script will update the system, fetch all dependencies, and git clone
# all of the libraries for running the @DoctorWkt Blinky for the ecp5 ULX3S Board
# including icestorm, nextpnr (or arachne-pnr), yosys
#
#
# A WSL-specific Makefile will also be fetched. (TODO)
#
# wget (TODO)/raw/Makefile -O Makefile
#
# or if you prefer the older arachne-pnr:
#
# wget (TODO)/raw/Makefile -O Makefile
#
# Works best with Ubuntu 18.04 or later

#***************************************************************************************************
# To fetch and use this file:
#
#   wget https://gist.githubusercontent.com/gojimmypi/f96cd86b2b8595b4cf3be4baf493c5a7/raw/ULXS3_WSL_Toolchain.sh -O ULXS3_WSL_Toolchain.sh
#   chmod +x ./ULXS3_WSL_Toolchain.sh
#   ./ULXS3_WSL_Toolchain.sh
#***************************************************************************************************

date
cd ~/
mkdir -p "$WORKSPACE"

echo ***************************************************************************************************
echo  "update/upgrade current system"
echo ***************************************************************************************************
sudo apt-get update --assume-yes
sudo apt-get upgrade --assume-yes

echo ***************************************************************************************************
echo  "git config"
echo ***************************************************************************************************
# These git .insteadOf options may not be needed if your firewall does not blocks the git ports, 
# but we set anyhow. 
#
# it is unlikely to cause harm for these repositories, unless for some reason your firewall is blocking HTTPS
sudo apt-get install git --assume-yes

# git config --global url.https://git.qemu.org/git/.insteadOf git://git.qemu-project.org/
# git config --global url.https://anongit.freedesktop.org/git/.insteadOf git://anongit.freedesktop.org/

# git config --global url.https://github.com/riscv.insteadOf git://github.com/riscv

# also consider somerthing like this for everything on GitHub:
# git config --global url.https://github.com/.insteadOf git://github.com/
#
# and to clear:
# git config --global --unset url.https://github.com/.insteadOf

cd "$WORKSPACE"
echo ***************************************************************************************************
echo  "install icestorm dependencies"
echo ***************************************************************************************************
# this next install needs a bit of disk space:
#   0 upgraded, 205 newly installed, 0 to remove and 3 not upgraded.
#   Need to get 130 MB of archives.
#   After this operation, 652 MB of additional disk space will be used.
#
sudo apt-get install build-essential clang bison flex libreadline-dev \
                     gawk tcl-dev libffi-dev git mercurial graphviz   \
                     xdot pkg-config python python3 libftdi-dev --assume-yes

echo ***************************************************************************************************
echo  "install nextpnr dependencies"
echo ***************************************************************************************************
# this next line is about another half gig of files!
#   0 upgraded, 249 newly installed, 0 to remove and 3 not upgraded.
#   Need to get 132 MB of archives.
#   After this operation, 623 MB of additional disk space will be used.
#
sudo apt-get install libboost-all-dev python3-dev qt5-default clang-format --assume-yes
sudo apt-get install cmake --assume-yes

echo ***************************************************************************************************
echo  "install verilator"
echo ***************************************************************************************************
# The following NEW packages will be installed:
#  verilator
# 0 upgraded, 1 newly installed, 0 to remove and 1 not upgraded.
# Need to get 2878 kB of archives.
# After this operation, 13.1 MB of additional disk space will be used.
# sudo apt-get install verilator

echo ***************************************************************************************************
echo  "update/upgrade current system again"
echo ***************************************************************************************************
sudo apt-get update --assume-yes
sudo apt-get upgrade --assume-yes

cd "$WORKSPACE"
echo ***************************************************************************************************
echo  "@DoctorWkt ULX3S-Blinky"
echo ***************************************************************************************************
if [ ! -d "$WORKSPACE"/ULX3S-Blinky ]; then
  git clone --recursive https://github.com/DoctorWkt/ULX3S-Blinky
  cd ULX3S-Blinky
else
  cd ULX3S-Blinky
  git fetch
  git pull
fi

sudo apio drivers --serial-enable
sudo usermod -a -G dialout $USER

cd "$WORKSPACE"
echo ***************************************************************************************************
echo  "icestorm"
echo ***************************************************************************************************
# see http://www.clifford.at/icestorm/
if [ ! -d "$WORKSPACE"/icestorm ]; then
  git clone https://github.com/cliffordwolf/icestorm.git icestorm
  cd icestorm
else
  cd icestorm
  git fetch
  git pull
  make clean
fi

make -j$(nproc)
sudo make install

cd "$WORKSPACE"
cho ***************************************************************************************************
echo  "arachne-pnr"
echo ***************************************************************************************************
if [ ! -d "$WORKSPACE"/arachne-pnr ]; then
  git clone https://github.com/cseed/arachne-pnr.git arachne-pnr
  cd arachne-pnr
else
  cd arachne-pnr
  git fetch
  git pull

  make clean
fi

make -j$(nproc)
sudo make install


cd "$WORKSPACE"
echo ***************************************************************************************************
echo  "prjtrellis (required for nextpnr-ecp5)"
echo ***************************************************************************************************
if [ ! -d "$WORKSPACE"/prjtrellis ]; then
  git clone --recursive https://github.com/SymbiFlow/prjtrellis
  cd prjtrellis
else
  cd prjtrellis
  git fetch
  git pull

fi


# You must run cmake from the libtrellis directory
cd libtrellis
make clean
cmake -DCMAKE_INSTALL_PREFIX=/usr .
make
sudo make install

cd "$WORKSPACE"
echo ***************************************************************************************************
echo  "nextpnr-ecp5"
echo ***************************************************************************************************
# see https://github.com/YosysHQ/nextpnr#nextpnr-ecp5
if [ ! -d "$WORKSPACE"/nextpnr ]; then
  git clone https://github.com/YosysHQ/nextpnr.git
  cd nextpnr
else
  cd nextpnr
  git fetch
  git pull

  make clean
fi

# Note the "=/path/to/prjtrellis" value is the install directory, not git workspace clone directory
# If CMake fails, try rm CMakeCache.txt
cmake -DARCH=ecp5 -DTRELLIS_ROOT=/usr/share/trellis/ .
make -j$(nproc)
sudo make install

cd "$WORKSPACE"
echo ***************************************************************************************************
echo  "yosys"
echo ***************************************************************************************************
# see http://www.clifford.at/yosys/
if [ ! -d "$WORKSPACE"/yosys ]; then
  git clone https://github.com/cliffordwolf/yosys.git yosys
  cd yosys
else
  cd yosys
  git fetch
  git pull

  make clean
fi

make -j$(nproc)
sudo make install

cd "$WORKSPACE"
echo ***************************************************************************************************
echo  "ujprog"
echo ***************************************************************************************************
# see https://github.com/f32c/tools/tree/master/ujprog
# NOTE: Although this successfully compiles, it does not seem to work in WSL (not USB device support)
if [ ! -d "$WORKSPACE"/f32c_tools ]; then
  git clone https://github.com/f32c/tools.git f32c_tools
  cd f32c_tools/ujprog
else
  cd f32c_tools
  git fetch
  git pull
  cd f32c_tools/ujprog

  make clean
fi

cp Makefile.linux Makefile
make
sudo make install

cd "$WORKSPACE"
echo ***************************************************************************************************
echo  "show versions installed"
echo ***************************************************************************************************
lsb_release -a
python --version
python3.5 --version
cmake --version
clang --version
echo qtf_default $(apt-cache show qt5-default | grep -m1 Version)
echo libboost-all-dev $(apt-cache show libboost-all-dev | grep -m1 Version)

for pk in build-essential clang bison flex libreadline-dev \
          gawk tcl-dev libffi-dev git mercurial graphviz   \
          xdot pkg-config python python3 libftdi-dev \
          qt5-default python3-dev libboost-dev; \
  do echo "$pk" $(apt-cache show "$pk" | grep -m1 Version); done

nextpnr-ecp5 --version
yosys -V

cd "$WORKSPACE"
echo ***************************************************************************************************
echo  build the ULX3S-Blinky
echo ***************************************************************************************************
# See https://github.com/DoctorWkt/ULX3S-Blinky

cd ULX3S-Blinky

# Get our WSL-specific Makefile
# wget (todo)/raw/Makefile -O Makefile

make clean

read -p "Press [Enter] to program ULX3S"

make prog

date

echo Done!
```