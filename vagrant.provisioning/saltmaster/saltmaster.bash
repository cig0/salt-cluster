#!/usr/bin/env bash

echo "Installing salt-master..."
set -ex
sudo apt-get update
sudo apt-get -y install mg tmux salt-master curl python3 python3-psycopg2 python3-bottle

# Fix Bob's private key permissions due to cloning the repo
sudo chmod 400 /srv/salt/ssh_keys/bob_rsa

echo "Starting salt-master service..."
sudo systemctl start salt-master && sudo systemctl status salt-master

echo "Waiting for the minions to report (so we can accept their keys)..."
sleep 30
sudo salt-key -yA

exit
