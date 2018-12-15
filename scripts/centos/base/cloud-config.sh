#!/bin/bash

yum -y install cloud-init cloud-utils cloud-utils-growpart
mv /opt/tmp/10-growpart.cfg /etc/cloud/cloud.cfg.d/10-growpart.cfg
chown root:root /etc/cloud/cloud.cfg.d/10-growpart.cfg
systemctl enable cloud-config.service
systemctl enable cloud-final.service
systemctl enable cloud-init-local.service
systemctl enable cloud-init.service
