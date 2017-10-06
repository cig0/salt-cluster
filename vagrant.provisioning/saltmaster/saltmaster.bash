#!/usr/bin/env bash

echo "Installing salt-master..."
set -ex
sudo apt-get update
sudo apt-get -y install mg tmux python3-pip salt-master

# pip3 install sqlalchemy
python3 -m pip install sqlalchemy

# Fix Bob's private key permissions due to cloning the repo
sudo chmod 400 /srv/salt/ssh_keys/bob_rsa

echo "Starting salt-master service..."
sudo systemctl start salt-master
sudo systemctl status salt-master

echo "Waiting for the minions to report (so we can accept their keys)..."
sleep 30
sudo salt-key -yA

exit
