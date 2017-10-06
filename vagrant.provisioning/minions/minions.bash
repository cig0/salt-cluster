#!/usr/bin/env bash

_hostname=$(hostname) 

set -ex
echo "Installing salt-minion on host: $_hostname..."
sudo apt-get update
sudo apt-get -y install mg tmux salt-minion python3-pip

# pip3 install sqlalchemy
python3 -m pip install

echo -e "\n# Salt master\n192.168.0.5     salt" | sudo tee -a /etc/hosts > /dev/null
echo "Starting salt-minion in host: $_hostname..."
sudo systemctl start salt-minion
sudo systemctl status salt-minion

exit
