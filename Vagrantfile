# -*- mode: ruby -*-
# vi: set ft=ruby :
# Author: andrei@skopenko.net

load 'Vagrantfile.local' if File.exist?('Vagrantfile.local')

hostname = 'vagrant-puppet-jenkins.dev'

Vagrant.configure('2') do |config|
  config.vm.hostname = hostname

  config.vm.provider 'parallels' do |v, override|
    v.name = hostname
    v.memory = 2048
    v.cpus = 1
    v.linked_clone = true
    override.vm.box = 'bento/centos-7.2'
    override.vm.synced_folder '~', '/opt/Home', mount_options: ['share']
    override.vm.synced_folder './src', '/opt/src', mount_options: ['share']
  end

  config.vm.provider 'virtualbox' do |v, override|
    v.name = hostname
    v.memory = 1024
    v.cpus = 2
    override.vm.box = 'bento/centos-7.2'
    override.vm.synced_folder '~', '/opt/Home'
    override.vm.synced_folder './src', '/opt/src'
  end

  # run `vagrant plugin install vagrant-puppet-install`
  config.puppet_install.puppet_version = :latest

  config.vm.provision :puppet do |puppet|
    puppet.environment_path = 'puppet/environments'
    puppet.environment = 'local'
    puppet.options = '--verbose'
  end
end
