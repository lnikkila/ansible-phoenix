# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "10.10.10.10"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "spec/support/playbook.yml"
    ansible.verbose = "vvvv"
  end
end

