#!/usr/bin/env bash

# varibales
setup_path="/vagrant/setup"
home_path="/home/ubuntu"
source $setup_path/config.sh

# update
sudo apt-get update

# install git
sudo apt-get install -y git
# configure git
git config --global user.name "$git_name"
git config --global user.email "$git_email"

# install nginx
sudo apt-get install -y nginx
# configure nginx
sudo update-rc.d nginx defaults
sudo service nginx restart

# install node & npm
sudo apt-get install -y build-essential
sudo apt-get install -y curl
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs
# install global node packages: yarn, gulp, webpack, yo, nodemon, react-cli, express-generator, ...
sudo npm install -g yarn webpack gulp yo nodemon

# install mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org --allow-unauthenticated
sudo cp $setup_path/services/mongodb.service /etc/systemd/system/mongodb.service
sudo systemctl start mongodb
sudo systemctl enable mongodb

# add aliases
cp $setup_path/dot-files/.bash_aliases $home_path/.bash_aliases

# create workspace
mkdir $setup_path/../workspace
