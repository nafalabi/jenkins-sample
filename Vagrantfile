Vagrant.configure("2") do |config|

  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.box = "hashicorp/bionic64"
    master.vm.network "private_network", ip: "192.168.56.2"
    master.vm.provision :shell, inline: <<-SCRIPT
      bash /vagrant/retrieve-docker.sh
      bash /vagrant/install-docker.sh
    SCRIPT
  end

  config.vm.define "worker1" do |client1|
    client1.vm.hostname = "client1"
    client1.vm.box = "hashicorp/bionic64"
    client1.vm.network "private_network", ip: "192.168.56.3"
    client1.vm.provision :shell, inline: <<-SCRIPT
      bash /vagrant/install-docker.sh
    SCRIPT
  end

end

