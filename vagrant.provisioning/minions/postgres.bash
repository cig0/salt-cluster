#!/usr/bin/env bash

set -ex

# Install PostgreSQL
echo "** This should be done using a Salt state or formula **"
echo "Installing and setting up PostgreSQL..."
sudo apt-get -y install postgresql

# Relax Postgres access permissions for an easier testing
echo -e "\nhost    all     all     0.0.0.0/0     trust" | sudo tee -a /etc/postgresql/9.6/main/pg_hba.conf > /dev/null
echo -e "\nlisten_addresses = '*'" | sudo tee -a /etc/postgresql/9.6/main/postgresql.conf > /dev/null

sudo systemctl restart postgresql && sudo systemctl status postgresql

# Add Plug.dj user and database
sudo -u postgres createuser plugdj
sudo -u postgres psql -c "ALTER USER plugdj WITH PASSWORD 'plugdj';"
sudo -u postgres createdb -O plugdj plugdj

exit
