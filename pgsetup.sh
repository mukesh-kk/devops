#!/bin/bash

# Variables
PG_VERSION="15"  # Change this to your desired PostgreSQL version
PG_USER="db"
PG_PASSWORD="mypassword"
PG_DATABASE="mydb"

# Update system packages
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install PostgreSQL
echo "Installing PostgreSQL..."
sudo apt install -y postgresql

# Configure PostgreSQL to listen on all interfaces
echo "Configuring PostgreSQL to allow external connections..."
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/${PG_VERSION}/main/postgresql.conf

# Allow external connections in pg_hba.conf
echo "Adding access rule to pg_hba.conf..."
echo "host    all             all             0.0.0.0/0            md5" | sudo tee -a /etc/postgresql/${PG_VERSION}/main/pg_hba.conf

# Restart PostgreSQL service
echo "Restarting PostgreSQL..."
sudo systemctl restart postgresql

# Set up PostgreSQL user and database
echo "Setting up PostgreSQL user and database..."
sudo -i -u postgres psql <<EOF
CREATE USER ${PG_USER} WITH PASSWORD '${PG_PASSWORD}';
CREATE DATABASE ${PG_DATABASE};
GRANT ALL PRIVILEGES ON DATABASE ${PG_DATABASE} TO ${PG_USER};
EOF

# Open port 5432 for PostgreSQL (using UFW as an example)
echo "Allowing connections on port 5432..."
sudo ufw allow 5432/tcp

echo "PostgreSQL installation and provisioning completed."
