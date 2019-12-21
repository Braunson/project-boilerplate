#!/bin/bash

LATEST_VERSION=$(curl -sS 'https://api.github.com/repos/phpmyadmin/phpmyadmin/releases/latest' | awk -F '"' '/tag_name/{print $4}')
DOWNLOAD_URL="https://api.github.com/repos/phpmyadmin/phpmyadmin/tarball/$LATEST_VERSION"

echo "Downloading phpMyAdmin $LATEST_VERSION"
wget $DOWNLOAD_URL -q -O 'phpmyadmin.tar.gz'

[ -d phpmyadmin ] || mkdir -p phpmyadmin

tar xf phpmyadmin.tar.gz -C phpmyadmin --strip-components 1
rm phpmyadmin.tar.gz
cp ./stubs/phpmyadmin.config.inc.php.dist $(pwd)/phpmyadmin/config.inc.php
cd phpmyadmin && composer update --no-dev --quiet --no-interaction

#
# Install some themes for variety, we like variety right?
#

# git clone https://git@github.com/mjohnson8165/pma8165-theme.git /home/vagrant/phpmyadmin/themes/pma8165
wget https://git@github.com/mjohnson8165/pma8165-theme/archive/v1.5.zip -q -O 'pma8165-theme.zip'
wget https://files.phpmyadmin.net/themes/metro/2.8/metro-2.8.zip -q -O 'metro-theme.zip'
wget https://files.phpmyadmin.net/themes/fallen/0.7/fallen-0.7.zip -q -O 'fallen-theme.zip'
wget https://files.phpmyadmin.net/themes/mhn/1.4/mhn-1.4.zip -q -O 'mhn-theme.zip'
unzip -qq -o $(pwd)/pma8165-theme.zip -d /home/vagrant/phpmyadmin/themes
unzip -qq -o $(pwd)/metro-theme.zip -d /home/vagrant/phpmyadmin/themes
unzip -qq -o $(pwd)/fallen-theme.zip -d /home/vagrant/phpmyadmin/themes
unzip -qq -o $(pwd)/mhn-theme.zip -d /home/vagrant/phpmyadmin/themes
