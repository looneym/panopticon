# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = "panopticon"
    vb.customize ["modifyvm", :id, "--vram", "32"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    vb.customize ["modifyvm", :id, "--audiocontroller", "hda"]
    vb.customize ["modifyvm", :id, "--audioout", "on"]
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    vb.memory = "2048"
  end

  config.vm.provision "shell", path: "bootstrap.sh"
end
