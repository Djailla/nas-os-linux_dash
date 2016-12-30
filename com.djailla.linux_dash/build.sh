#!/bin/bash

mkdir -m 755 -p /opt/linux_dash/
install -m 755 /home/source/rc.local /etc

# Install nodejs components
apt-get update
apt-get install -y -q git

# Checkout sources in /opt
cd /opt/linux_dash/
git clone --depth=1 https://github.com/afaqurk/linux-dash.git

# Cleanup
apt-get -y -q autoremove git
apt-get -y -q clean

exit 0
