# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'precise64', autostart: false do |vm|
    vm.vm.box = 'ubuntu/precise64'
  end

  config.vm.define 'trusty64', autostart: false do |vm|
    vm.vm.box = 'ubuntu/trusty64'
  end

  config.vm.define 'wily64', autostart: false do |vm|
    vm.vm.box = 'ubuntu/wily64'
  end

  config.vm.define 'xenial64', primary: true do |vm|
    vm.vm.box = 'ubuntu/xenial64'
  end

  config.vm.define 'jessie64', autostart: false do |vm|
    vm.vm.box = 'debian/jessie64'
  end

  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1024']
    vb.customize ['modifyvm', :id, '--nictype1', 'virtio']
  end

  config.vm.provision :shell, path: 'provision.sh'
  config.vm.provision :shell, path: 'provision-timesyncd.sh'
  config.vm.provision :shell, path: 'provision-anyenv.sh', privileged: false
  config.vm.provision :shell, path: 'provision-libressl.sh', privileged: false
  config.vm.provision :shell, path: 'provision-ruby.sh', privileged: false
end
