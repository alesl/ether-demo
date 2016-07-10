Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  config.vm.network :forwarded_port, guest: 22, host: 1240
  if Vagrant::Util::Platform.windows?
    config.vm.synced_folder '.', '/vagrant', nfs: true, mount_options: ['rw']
  else
    config.vm.network "private_network", ip: "10.20.10.10"
    config.vm.synced_folder '.', '/vagrant', nfs: true
    config.bindfs.bind_folder "/vagrant", "/vagrant"
  end
  config.vm.provision "shell", path: "vagrant/provision.sh"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    v.memory = 1024
  end
end
