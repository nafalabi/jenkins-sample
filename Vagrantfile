Vagrant.configure("2") do |config|

  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.hostname = "jenkin"
    jenkins.vm.box = "hashicorp/bionic64"
    jenkins.vm.network "private_network", ip: "192.168.56.2"
    jenkins.vm.provision :shell, inline: <<-SCRIPT
      bash /vagrant/retrieve-docker.sh
      bash /vagrant/install-docker.sh
      bash /vagrant/generate-jenkins-key.sh
      cp /vagrant/resources/jenkins-key /home/vagrant/.ssh/id_ed25519
      cp /vagrant/resources/jenkins-key.pub /home/vagrant/.ssh/id_ed25519.pub
      chown vagrant:vagrant /home/vagrant/.ssh/id*
    SCRIPT
  end

  config.vm.define "registry" do |registry|
    registry.vm.hostname = "registry"
    registry.vm.box = "hashicorp/bionic64"
    registry.vm.network "private_network", ip: "192.168.56.3"
    registry.vm.provision :shell, inline: <<-SCRIPT
      bash /vagrant/install-docker.sh
    SCRIPT
  end

  config.vm.define "appstaging" do |appstaging|
    appstaging.vm.hostname = "appstaging"
    appstaging.vm.box = "hashicorp/bionic64"
    appstaging.vm.network "private_network", ip: "192.168.56.4"
    appstaging.vm.provision :shell, inline: <<-SCRIPT
      echo "{ \"insecure-registries\" : [ \"192.168.56.3\" ] } " > /etc/docker/daemon.json
      bash /vagrant/install-docker.sh
      cat /vagrant/resources/jenkins-key.pub >> /home/vagrant/.ssh/authorized_keys
    SCRIPT
  end

  config.vm.define "appprod" do |appprod|
    appprod.vm.hostname = "appprod"
    appprod.vm.box = "hashicorp/bionic64"
    appprod.vm.network "private_network", ip: "192.168.56.5"
    appprod.vm.provision :shell, inline: <<-SCRIPT
      echo "{ \"insecure-registries\" : [ \"192.168.56.3\" ] } " > /etc/docker/daemon.json
      bash /vagrant/install-docker.sh
      cat /vagrant/resources/jenkins-key.pub >> /home/vagrant/.ssh/authorized_keys
    SCRIPT
  end

end

