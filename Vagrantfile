# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "vagrantbox_es/trusty64"
  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.host_name = 'trusty64-docker'

  config.vm.provision :shell, :path => "bootstrap.sh"
  for port in 49000..49900
    config.vm.network :forwarded_port, host: port, guest: port
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096" ]
    # http://stackoverflow.com/a/17126363
    vb.customize ["modifyvm", :id, "--cpus", "4" ]
    vb.customize ["modifyvm", :id, "--ioapic", "on" ]
  end
end
