#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

# Update
sudo apt-get update

# Install PHPMyAdmin
echo 'installing PHPMyAdmin'
sh /home/vagrant/code/.homestead/pma-setup.sh

# Install Lavalog
# By default convert the line endings just in case
sed -i -e 's/\r$//' /home/vagrant/project/.homestead/lavalog
cp /home/vagrant/project/.homestead/lavalog /usr/local/bin/lavalog
chmod 755 /usr/local/bin/lavalog

# Install some global tools we need
# All tools from http://jenkins-php.org/installation.html
composer global require friendsofphp/php-cs-fixer "squizlabs/php_codesniffer=*" phpunit/phpunit phploc/phploc pdepend/pdepend phpmd/phpmd sebastian/phpcpd theseer/phpdox hirak/prestissimo infection/infection --quiet --no-interaction

# Install php-gmp extention/module that we need for WebPush notifications!
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install php7.4-gmp
sudo service php7.4-fpm restart
