#!/bin/bash

yum localinstall -y nice-*
systemctl enable dcvserver
systemctl start dcvserver

# passwd centos

# dcv create-session --type=console --owner centos session1
#dcv list-sessions
