#!/usr/bin/env bash

# vagrant by default creates its own keypair for all the machines. Password based authentication will be disabled by default and enabling it so password based auth can be done.

sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Supressing the banner message everytime you connect to the vagrant box.

touch /home/vagrant/.hushlogin

# Updating the hosts file for all the 3 nodes with the IP given in vagrantfile

echo -e "192.168.56.3 controller.kubelab.com controller\n192.168.56.4 worker1.kubelab.com worker1\n192.168.56.5 worker2.kubelab.com worker2" >> /etc/hosts

# Installing necessary packages 

sudo apt update && sudo apt -y install curl vim bash-completion wget net-tools iputils-ping sshpass

# Diasble swap
sudo swapoff -a
