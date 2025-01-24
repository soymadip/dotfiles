#!/bin/env bash

# Start/install MariaDB (Arch implementation of MySQL)
if ! command -v mariadb &>/dev/null; then
    echo "Installing MariaDB (Arch implementation of MySQL)..."
    pkexec pacman -S --needed mariadb
else
    echo "MariaDB is already installed."
fi

# Initialize the data directory and prepare the environment for a new MariaDB server installation
DATA_DIR="/var/lib/mysql"

if [ -d "$DATA_DIR/mysql" ]; then
    echo "MariaDB system tables already exist. No initialization needed."
else
    echo "MariaDB system tables not found. Initializing..." 
    pkexec mariadb-install-db --user=mysql --basedir=/usr --datadir="$DATA_DIR"
    echo "Initialization completed."
fi

# Start MariaDB
if ! systemctl is-active --quiet mariadb; then
    echo "Starting MariaDB service..."
    pkexec systemctl start --now mariadb.service
    echo "MariaDB service started and enabled."
else
    echo "MariaDB service is already running."
fi


# Reset root password to 'jio'
echo "Setting root password to 'jio'..."
pkexec mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'jio'; FLUSH PRIVILEGES;"


# Start/Install MySQL Workbench
if ! command -v mysql-workbench &>/dev/null; then
    echo "Installing MySQL Workbench..."
    pkexec pacman -S --needed mysql-workbench
fi

# Launch MySQL Workbench
echo "Launching MySQL Workbench..."
mysql-workbench "$1"

# Stop MariaDB service (optional)
echo "Stopping MariaDB service..."
pkexec systemctl stop mariadb.service
echo "MariaDB service stopped."

