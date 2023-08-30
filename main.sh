#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://github.com/anatol/booster.git
cd booster
cp -rvf ../debian ./
cp -f ../Makefile ./Makefile
cp -f ../update-initramfs ./update-initramfs

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
