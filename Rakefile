require 'yaml'
require 'erb'
require 'json'
require 'ostruct'

def erb(template, vars)
  ERB.new(template).result(OpenStruct.new(vars).instance_eval { binding })
end

desc "Custom: Validate manifests, (erb/epp)templates, and ruby files"
task :check do
    Dir['packer-*.json'].each do |template|
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

desc "Parse ERB templates"
task :parse do
 Dir['http/win/**/*.xml.erb'].each do |template|
    os_version = template.split('/')[2]
    var_hash = JSON.parse(File.read("autounattend/#{os_version}/autounattend.json"))
    File.open("http/win/#{os_version}/Autounattend.xml", "w+") do |f|
      f.write(erb(File.read(template), var_hash[os_version]))
    end
  end
end

task :default => [:r10k, :parse, :check]
