# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.provider "virtualbox" do |rs|
    rs.memory = 2048
    rs.cpus = 2
  end

  # Will not check for box updates during every startup.
  config.vm.box_check_update = false


  # Master node where ansible will be installed
  config.vm.define "controller" do |controller|
    controller.vm.box = "ubuntu/focal64"
    controller.vm.hostname = "controller.kubelab.com"
    controller.vm.network "private_network", ip: "192.168.56.3"
    controller.vm.provision "shell", path: "bootstrap.sh"
    controller.vm.provision "file", source: "key_gen.sh", destination: "/home/vagrant/"
  end

  # Managed node 1.
  config.vm.define "worker1" do |worker1|
    worker1.vm.box = "ubuntu/focal64"
    worker1.vm.hostname = "worker1.kubelab.com"
    worker1.vm.network "private_network", ip: "192.168.56.4"
    worker1.vm.provision "shell", path: "bootstrap.sh"
  end

  # Managed node 2.
  config.vm.define "worker2" do |worker2|
    worker2.vm.box = "ubuntu/focal64"
    worker2.vm.hostname = "worker2.kubelab.com"
    worker2.vm.network "private_network", ip: "192.168.56.5"
    worker2.vm.provision "shell", path: "bootstrap.sh"
  end

end
