

case $::osfamily{

  redhat: {
    include 'cis_benchmarks'
  }

  default: { ("${osfamily} is not supported") }

}
