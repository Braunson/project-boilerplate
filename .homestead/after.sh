#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

# Update
sudo apt-get update

# Install PHPMyAdmin
echo "\n--- Downloading and installing phpMyAdmin 4.6.6 ---\n"
curl -sS https://files.phpmyadmin.net/phpMyAdmin/4.6.6/phpMyAdmin-4.6.6-english.tar.gz -o phpmyadmin.tar.gz
tar xf phpmyadmin.tar.gz -C phpmyadmin --strip-components 1
rm phpmyadmin.tar.gz
