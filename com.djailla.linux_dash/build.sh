#!/bin/bash

mkdir -m 755 -p /opt/linux_dash/

install -m 755 /home/source/rc.local /etc

# Install nodejs components
apt-get update
apt-get install -y -q curl git
if [ $RAINBOW_ARCHITECTURE = "x86_64" ]
then
    curl -sL https://deb.nodesource.com/setup_5.x | bash -
    apt-get install -y -q nodejs npm
else
    echo "ARM"
fi

# Checkout sources in /opt
cd /opt/linux_dash/
git clone https://github.com/afaqurk/linux-dash.git

# Install the component
cd linux-dash
npm install

# Cleanup
apt-get autoremove curl git
apt-get clean

exit 0
