#!/bin/bash

yum install -y epel-release
yum update
yum groupinstall -y  "Development Tools"
yum install -y xorg-* kernel-devel dkms python-pip lsb
pip install -y awscli
yum groupinstall -y  "KDE Plasma Workspaces"
#AWS security groups will provide our firewall rules
systemctl disable firewalld 
# if there is a kernel update
#reboot