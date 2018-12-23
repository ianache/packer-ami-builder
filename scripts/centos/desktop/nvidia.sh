#!/bin/bash

aws s3 cp --recursive s3://ec2-linux-nvidia-drivers/ .
chmod +x latest/NVIDIA-Linux-x86_64-390.57-grid.run
sudo .latest/NVIDIA-Linux-x86_64-390.57-grid.run
# register the driver with dkms, ignore errors associated with 32bit compatible libraries
sudo systemctl set-default graphical.target

mv /tmp/xorg.cfg /etc/X11/


## Optimization
nvidia-smi --auto-boost-default=0
nvidia-smi -ac 2505,1177