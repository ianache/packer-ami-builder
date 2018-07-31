#!/bin/sh

# Set $PUPPET_VERSION inside Packer's template. Valid options are:
#   'provisionerless' -- build a image without Puppet
#   'x.y.z'           -- build a image with version x.y.z of Puppet
#   'latest'          -- build a image with the latest version of Puppet

os_ver="$(rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release))"

  sudo rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-${os_ver}.noarch.rpm
  sudo yum -y install puppet-agent

  sudo rm -f /etc/yum.repos.d/puppetlabs.repo
  #sudo rpm -e puppetlabs-release

