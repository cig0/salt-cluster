#!/usr/bin/env bash

set -ex
echo "** This should be done using a Salt state or formula **"
echo "Installing and setting up PostgreSQL..."
sudo apt-get -y install postgresql
sudo systemctl start postgresql && sudo systemctl status postgresql
sudo -u postgres createuser plugdj
sudo -u postgres psql -c "ALTER USER plugdj WITH PASSWORD 'plugdj';"
sudo -u postgres createdb -O plugdj plugdj

echo -e "\n# Salt master\n192.168.0.5     salt" | sudo tee -a /etc/hosts > /dev/null
echo "Starting salt-minion in host: $_hostname..."
sudo systemctl start salt-minion && sudo systemctl status salt-minion

exit
