#!/bin/bash

BASEDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
USERNAME=$1
PASSWORD=$2

printHelp() {
  echo -e "\nInvalid usage.\n"
  echo "  usage: ./setup-passwd.sh <username> <password>"
  echo
}

if [ -z "$USERNAME" ] || [ -z "$PASSWORD" ]; then
  printHelp
fi

docker run --rm -ti elswork/apache2-utils htpasswd -Bbn $USERNAME $PASSWORD > $BASEDIR/registry.password

