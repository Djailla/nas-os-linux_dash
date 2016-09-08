#!/bin/bash

mkdir -m 755 -p /opt/linux_dash/

install -m 755 /home/source/rc.local /etc

# Install nodejs components
apt-get update
apt-get install -y -q curl git
if [ $RAINBOW_ARCHITECTURE = "x86_64" ]
then
    curl -sL https://deb.nodesource.com/setup_6.x | bash -
    apt-get install -y -q nodejs
else
    echo "ARM"
fi

# Checkout sources in /opt
cd /opt/linux_dash/
git clone --depth=1 https://github.com/afaqurk/linux-dash.git

# Install the component
cd linux-dash
npm install

# Cleanup
apt-get -y -q autoremove curl git
apt-get -y -q clean

exit 0
