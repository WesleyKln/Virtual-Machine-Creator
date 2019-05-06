#!/bin/bash


#### BEST SCRIPT EVER ! ####

clear

echo 'Welcome to Virtual Machine Creator !'

echo 'First, choose a number betweeen 10 and 250 to build an ip address (192.168.33.XXX) :'
read ip

while [[ $ip -lt 10 || $ip -gt 250 ]];
do
	echo "The number must be greater than 10 and less than 250.. please choose a correct number";
read ip
done

echo 'Now, please choose a name for your sync folder :'
read syncFolder

echo 'Finally, choose the name of your Vitual Machine :'
read vitualMachineName


#### CREATE SYNCFOLDER ####

mkdir ./$syncFolder


#### BUILD VAGRANTFILE ####

echo "
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(\"2\") do |config|
  config.vm.box = \"ubuntu/xenial64\"
  config.vm.network \"private_network\", ip: \"192.168.33.$ip\"
  config.vm.synced_folder \"./$syncFolder\", \"/var/www/html/\"
  config.vm.provider \"virtualbox\" do |v|
    v.name = \"$vitualMachineName\"
  end
end
" >./Vagrantfile


#### DOWNLOAD ADMINER FOR MYSQL (v4.7.1) ####

sudo wget -cO - https://www.adminer.org/latest-mysql.php > ./$syncFolder/adminer.php


#### CREATE A SCRIPT TO INSTALL APACHE, PHP(7.2 WITH PHP ERRORS ON) AND MYSQL ####
#### THEN PLACE IT INTO THE SYNC FOLDER TO BE ACCESSIBLE FROM THE VM TERMINAL ####

echo "
#!bin/bash

#### INSTALLATION ####

sudo add-apt-repository ppa:ondrej/php -y
sudo apt update && sudo apt upgrade -y
sudo apt install apache2 -y
sudo apt install php7.2 -y
sudo apt install libapache2-mod-php7.2 -y
sudo apt install php7.2-mysql -y
sudo apt install mysql-server -y

#### CHANGE THE DISPLAYS_ERRORS ON PHP.INI INTO ON ####

sudo sed -i '479s/Off/On/' /etc/php/7.2/apache2/php.ini
sudo sed -i '490s/Off/On/' /etc/php/7.2/apache2/php.ini

#### RESTART APACHE ####

sudo service apache2 restart
" >./$syncFolder/startInstall.sh


#### LOAD VM AND SWITCH INTO IT ####

vagrant up
vagrant ssh