# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.8.0'
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Using Puppet Labs official Vagrant boxes, from: https://atlas.hashicorp.com/puppetlabs
  config.vm.box = 'puppetlabs/ubuntu-14.04-64-puppet'

  config.vm.provider 'virtualbox' do |vbox|
    vbox.memory = 512
#   vbox.cpus = 2
  end

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
  end

  config.vm.provision :shell, :path => '.vagrant_puppet/init.sh'

  config.vm.provision :puppet do |puppet|
    puppet.environment_path = '.vagrant_puppet/environments'
    puppet.environment = 'vagrant'
    puppet.options = '--verbose'
#    puppet.hiera_config_path = "hiera.yaml"
  end

  config.vm.define "client1" do |buildclient1|
    buildclient1.vm.hostname = "client1.example.net"
    buildclient1.vm.network "private_network", ip: "192.168.50.4"
  end

  config.vm.define "client2" do |buildclient2|
    buildclient2.vm.hostname = "client2.example.net"
    buildclient2.vm.network "private_network", ip: "192.168.50.5"
  end


#  config.vm.provision :serverspec do |spec|
#    spec.pattern = 'serverspec/*_spec.rb'
#  end

end

#unless Vagrant.has_plugin?('vagrant-serverspec')
#  raise "\n\n'vagrant-serverspec' is NOT installed." +
#        "\nTo install, run: 'vagrant plugin install vagrant-serverspec'."
#end
