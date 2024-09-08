#/bin/sh

if [ -e /vagrant/resources/jenkins-key ]; then
  echo "key already exist skipping..."
  exit
fi

ssh-keygen -t ed25519 -f /vagrant/resources/jenkins-key -q -N ""

