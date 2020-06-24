#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.
#
# If you have user-specific configurations you would like
# to apply, you may also create user-customizations.sh,
# which will be run after this script.

# If you're not quite ready for Node 12.x
# Uncomment these lines to roll back to
# v11.x or v10.x

# Remove Node.js v12.x:
#sudo apt-get -y purge nodejs
#sudo rm -rf /usr/lib/node_modules/npm/lib
#sudo rm -rf //etc/apt/sources.list.d/nodesource.list

# Install Node.js v11.x
#curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
#sudo apt-get install -y nodejs

# Install Node.js v10.x
#curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
#sudo apt-get install -y nodejs

# Installing PHPMyAdmin
LATEST_VERSION=$(curl -sS 'https://api.github.com/repos/phpmyadmin/phpmyadmin/releases/latest' | awk -F '"' '/tag_name/{print $4}')
DOWNLOAD_URL="https://api.github.com/repos/phpmyadmin/phpmyadmin/tarball/$LATEST_VERSION"

echo "Downloading phpMyAdmin $LATEST_VERSION"
wget $DOWNLOAD_URL -q -O 'phpmyadmin.tar.gz'
mkdir phpmyadmin && tar xf phpmyadmin.tar.gz -C phpmyadmin --strip-components 1
rm phpmyadmin.tar.gz

echo "Installing dependencies for phpMyAdmin"
cd phpmyadmin && composer update --no-dev --quiet --no-interaction && yarn


# Install some global tools we need
# All tools from http://jenkins-php.org/installation.html
# Removed theseer/phpdox due to deprecated requirements
# Removed sebastian/phpcpd due to deprecated requirements
composer global require friendsofphp/php-cs-fixer "squizlabs/php_codesniffer=*" phpunit/phpunit phploc/phploc pdepend/pdepend phpmd/phpmd hirak/prestissimo infection/infection sarfraznawaz2005/composer-cost --quiet --no-interaction

# Adjust some PHP configuration
# for i in /etc/php/7.4/fpm/php.ini;
# do
# 	sudo sed -i 's|memory_limit = 512M|memory_limit  = -1|' $i
# done

# Adjust CLI PHP Configuration
for i in /etc/php/7.4/cli/php.ini;
do
    sudo sed -i 's|memory_limit = 512M|memory_limit  = -1|' $i
done

# Install npm dependencies and build site scripts/styles.
# cd /home/vagrant/code; npm install; npm run dev

# # Run database migrations
# cd /home/vagrant/code; php artisan migrate

# Install php-gmp extention/module that we need for WebPush notifications!
# sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install software-properties-common
# sudo add-apt-repository ppa:ondrej/php
# sudo apt-get -y update
# sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install php7.4-gmp

# Restart PHP
# sudo service php7.4-fpm restart
