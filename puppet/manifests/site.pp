

case $::osfamily{

  windows: {

    class { 'windows_cis::rules':
      ensure => 'present',
      list   => 'all',
    }
  }

  redhat: {}

  default: {("operating system ${::osfamily} not supported")}
}
