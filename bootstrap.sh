#!/bin/bash

component=$1
sudo dnf install ansible -y

cd /home/ec2-user
git clone  https://github.com/Tarunteja5182/ansible-roboshop-roles-tf.git
cd ansible-roboshop-roles-tf
git pull
ansible-playbook -e component=$component roboshop.yaml