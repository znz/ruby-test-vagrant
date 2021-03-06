# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'jessie64', primary: true do |vm|
    vm.vm.box = 'debian/contrib-jessie64'
    if Vagrant.has_plugin?("vagrant-cachier")
      vm.cache.scope = :box
    end
  end

  config.vm.define 'precise64', autostart: false do |vm|
    vm.vm.box = 'ubuntu/precise64'
    vm.vm.hostname = 'precise64'
    if Vagrant.has_plugin?("vagrant-cachier")
      vm.cache.scope = :box
    end
  end

  config.vm.define 'trusty64', autostart: false do |vm|
    vm.vm.box = 'ubuntu/trusty64'
    if Vagrant.has_plugin?("vagrant-cachier")
      vm.cache.scope = :box
    end
  end

  config.vm.define 'xenial64', autostart: false do |vm|
    vm.vm.box = 'bento/ubuntu-16.04'
    vm.vm.hostname = 'xenial64'
    if Vagrant.has_plugin?("vagrant-cachier")
      vm.cache.scope = :box
      vm.cache.synced_folder_opts = {
        owner: "_apt",
        group: "_apt",
        mount_options: ["dmode=777", "fmode=666"]
      }
    end
  end

  config.vm.define 'yakkety64', autostart: false do |vm|
    vm.vm.box = 'boxcutter/ubuntu1610'
    vm.vm.hostname = 'yakkety64'
    if Vagrant.has_plugin?("vagrant-cachier")
      vm.cache.scope = :box
      vm.cache.synced_folder_opts = {
        owner: "_apt",
      }
    end
  end

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 1024
    vb.cpus = 2
    vb.customize ['modifyvm', :id, '--nictype1', 'virtio']
    vb.customize [
      "modifyvm", :id,
      "--hwvirtex", "on",
      "--nestedpaging", "on",
      "--largepages", "on",
      "--ioapic", "on",
      "--pae", "on",
      "--paravirtprovider", "kvm",
    ]
  end

  config.vm.provision :shell, path: 'provision-etckeeper.sh'
  config.vm.provision :shell, path: 'provision-ja_JP.sh'
  config.vm.provision :shell, path: 'provision-journald.sh'
  config.vm.provision :shell, path: 'provision-timesyncd.sh'
  config.vm.provision :shell, path: 'provision-packages.sh'
  config.vm.provision :shell, path: 'provision-packages-misc.sh'
  config.vm.provision :shell, path: 'provision-packages-go.sh'
  config.vm.provision :shell, path: 'provision-nadoka.sh'
  config.vm.provision :shell, path: 'provision-dot-shell.sh', privileged: false
  config.vm.provision :shell, path: 'provision-anyenv.sh', privileged: false
  config.vm.provision :shell, path: 'provision-go.sh', privileged: false
  config.vm.provision :shell, path: 'provision-libressl.sh', privileged: false
  config.vm.provision :shell, path: 'provision-ruby-git.sh', privileged: false
  config.vm.provision :shell, path: 'provision-old-openssl.sh', privileged: false
  config.vm.provision :shell, path: 'provision-ruby-released.sh', privileged: false
  config.vm.provision :shell, path: 'provision-ruby-latest.sh', privileged: false
  config.vm.provision :shell, path: 'provision-vim.sh', privileged: false
end
