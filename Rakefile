require 'yaml'

desc "Custom: Validate manifests, (erb/epp)templates, and ruby files"
task :check do
    Dir['*.json'].each do |template|
          sh "packer validate #{template}"
            end

    #Dir['puppet/**/*.pp'].each do |manifest|
        sh "puppet parser validate --noop puppet/manifests/site.pp"
    #end

    Dir['puppet/hiera/**/*.yaml'].each do |yaml_file|
     sh "ruby -e \"require 'yaml'; YAML.load_file('#{yaml_file}')\""
    end
end

desc "Custom: Download third-party modules"
task :r10k do
  system 'r10k puppetfile check'
  system 'r10k puppetfile purge'
  system 'r10k puppetfile install -v'
end

task :default => [:r10k, :check]
