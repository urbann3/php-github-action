#!/bin/bash

VERSION=""

# get parameters
while getopts "v:" opt
do
  case "${opt}" in
    v) VERSION=${OPTARG};;
  esac
done

sudo apt-get update
sudo apt-get -y install software-properties-common
sudo apt-get install -y php${VERSION} \ 
php${VERSION}-fpm \
php${VERSION}-mysql \ 
php${VERSION}-curl \
php${VERSION}-mbstring \ 
php${VERSION}-xml \
php${VERSION}-cli \
php${VERSION}-gd \
php${VERSION}-intl \ 
php${VERSION}-zip \
php-xdebug
sudo apt-get -y install libpcre3
sudo apt-get -y install ffmpeg

echo "==== set php to version ${VERSION} ===="
sudo update-alternatives --set php /usr/bin/php${VERSION}
sudo update-alternatives --set phar /usr/bin/phar${VERSION}
sudo update-alternatives --set phar.phar /usr/bin/phar.phar${VERSION}