require 'yaml'
require 'erb'

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

desc "Parse ERB templates"
task :parse do
  ##loops through all .erb and use the specific ENV variable Windows Key for that specific o
  Dir['http/win/**/*.xml.erb'].each do |template|
    os_version = template.split('/')[2]
    @windows_key = ENV["PACKER_WINDOWS_KEY_#{os_version}"]
    renderer = ERB.new File.read(template), nil, "%"
    File.open("http/win/#{os_version}/Autounattend.xml", "w+") do |f|
      f.write(renderer.result(binding))
    end
  end
end

task :default => [:r10k, :parse, :check]
