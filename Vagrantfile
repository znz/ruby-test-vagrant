# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.define 'precise64', autostart: false do |vm|
    vm.vm.box = 'ubuntu/precise64'
  end

  config.vm.define 'trusty64', autostart: false do |vm|
    vm.vm.box = 'ubuntu/trusty64'
  end

  config.vm.define 'xenial64', autostart: false do |vm|
    vm.vm.box = 'ubuntu/xenial64'
  end

  config.vm.define 'jessie64', primary: true do |vm|
    vm.vm.box = 'debian/contrib-jessie64'
  end

  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1024']
    vb.customize ['modifyvm', :id, '--nictype1', 'virtio']
  end

  config.vm.provision :shell, path: 'provision.sh'
  config.vm.provision :shell, path: 'provision-timesyncd.sh'
  config.vm.provision :shell, path: 'provision-packages.sh'
  config.vm.provision :shell, path: 'provision-packages-misc.sh'
  config.vm.provision :shell, path: 'provision-nadoka.sh'
  config.vm.provision :shell, path: 'provision-dot-shell.sh', privileged: false
  config.vm.provision :shell, path: 'provision-anyenv.sh', privileged: false
  config.vm.provision :shell, path: 'provision-go.sh', privileged: false
  config.vm.provision :shell, path: 'provision-libressl.sh', privileged: false
  config.vm.provision :shell, path: 'provision-ruby-git.sh', privileged: false
  config.vm.provision :shell, path: 'provision-old-openssl.sh', privileged: false
  config.vm.provision :shell, path: 'provision-ruby-released.sh', privileged: false
end
