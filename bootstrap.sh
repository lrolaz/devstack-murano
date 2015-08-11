!/usr/bin/env bash

# Install base tools
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y wget
sudo apt-get install -y python-pip
sudo apt-get install -y python-dev

# Download kilo stable devstack
git clone -b stable/kilo https://github.com/openstack-dev/devstack.git
cd devstack
wget -O local.conf https://github.com/lrolaz/devstack-murano/raw/stable/kilo/local.conf
wget -O lib/murano https://github.com/openstack/murano/raw/stable/kilo/contrib/devstack/lib/murano
wget -O lib/murano-dashboard https://github.com/openstack/murano/raw/stable/kilo/contrib/devstack/lib/murano-dashboard
wget -O extras.d/70-murano.sh https://github.com/openstack/murano/raw/stable/kilo/contrib/devstack/extras.d/70-murano.sh

# Replace Host IP
sed -i '/HOST_IP/ c HOST_IP=192.168.61.2' local.conf

# Do the stacking
./stack.sh
