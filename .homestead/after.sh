#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

# Update
sudo apt-get update

# Install PHPMyAdmin
echo 'installing PHPMyAdmin'
curl -s -S https://gist.githubusercontent.com/Braunson/f7205b83bef1acfb2fe833fdefd30271/raw/phpmyadmin.sh | bash -s phpmyadmin.local

# Install Lavalog
# By default convert the line endings just in case
sed -i -e 's/\r$//' /home/vagrant/project/.homestead/lavalog
cp /home/vagrant/project/.homestead/lavalog /usr/local/bin/lavalog
chmod 755 /usr/local/bin/lavalog

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
# for i in /etc/php/7.4/cli/php.ini;
# do
#     sudo sed -i 's|memory_limit = 512M|memory_limit  = -1|' $i
# done

# Install php-gmp extention/module that we need for WebPush notifications!
# sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install software-properties-common
# sudo add-apt-repository ppa:ondrej/php
# sudo apt-get -y update
# sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" install php7.4-gmp

# Restart PHP
# sudo service php7.4-fpm restart
