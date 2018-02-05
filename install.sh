#! /bin/bash

# exit if a command fails
set -e

apt-get update
# we need to install software-properties-common in order to use add-apt-repository:
apt-get install -y less vim sudo curl software-properties-common xauth
add-apt-repository ppa:octave/stable
apt-get update
echo
echo "%%%%%% \033[36mInstalling Octave v${OCTAVE_VERSION}\033[0m %%%%%%"
echo
apt-get install -y "octave=${OCTAVE_VERSION}*"
#apt remove -y software-properties-common

# cleanup package manager
apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
mkdir /source
