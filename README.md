# Node Box

A virtual machine for node projects development made using [vagrant](https://www.vagrantup.com)

# Specifications and Tools:

- OS: Ubuntu 16.04 x64
- git + aliases (defined in setup/dot-files/.bash_aliases)
- nginx
- mongodb
- node 7.x and npm
- global node packages: yarn, webpack, gulp, yo and nodemon

# Installation

First you need to install [virtualbox](https://www.virtualbox.org/wiki/Downloads) and [vagrant](https://www.vagrantup.com/docs/installation/).

then

```bash
# clone this repository to your local
$ git clone https://github.com/webNeat/node-box.git
# enter the vm directory
cd node-box/

# edit the setup/config.sh with your information

# create and boot the vm
vagrant up
# connect to the vm
vagrant ssh

# now you should be logged in and see the 
# line is starting with "ubuntu@ubuntu-xenial"

# we will go to the shared folder
cd /vagrant
# this folder is mapped to the vm machine (yeah it's 
# the same directory you just cloned)

# run the initial setup
source ./setup/run.sh 
# this will setup your environment tools and may take a while

# now you have all basic tools installed and ready for use
# the next step is to generate an ssh key and add it to your 
# github/bitbucket account to avoid having to type password each time
source ./setup/ssh-key.sh
# this will generate a key if missing and show it, so you only need 
# to copy it and add it to your account settings:
# Github:    https://github.com/settings/keys
# Bitbucket: https://bitbucket.org/account/user/{{username}}/ssh-keys/

# now have fun working on your workspace at /vagrant/workspace which is 
# shared between the vm and the host machine, so you may edit files
# however you like ...
# you can exit the ssh session using Ctrl+D
# refer to vagrant documentation for more details and commands

# have fun :)
```
