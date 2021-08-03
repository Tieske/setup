#!/usr/bin/env bash

# originally written for an AWS EC2 instance running Ubuntu

sudo apt-get update
sudo apt-get install -y apt-transport-https curl lsb-core httpie
sudo apt-get install -y build-essential docker-compose unzip

# Kong specific
echo "deb https://kong.bintray.com/kong-deb `lsb_release -sc` main" | sudo tee -a /etc/apt/sources.list
curl -o bintray.key https://bintray.com/user/downloadSubjectPublicKey?username=bintray
sudo apt-key add bintray.key
rm bintray.key
sudo apt-get update
sudo apt-get install -y kong

# symlink 'lua' to luajit
sudo ln -s /usr/local/openresty/luajit/bin/luajit /usr/local/openresty/luajit/bin/lua

# add luajit to path
echo 'export PATH="/usr/local/openresty/luajit/bin:$PATH"' >> "$HOME/.profile"

# add resty to path
echo 'export PATH="/usr/local/openresty/bin:$PATH"' >> "$HOME/.profile"

# set up Git
git config --global user.name "Thijs Schreijer"
git config --global user.email "thijs@thijsschreijer.nl"
