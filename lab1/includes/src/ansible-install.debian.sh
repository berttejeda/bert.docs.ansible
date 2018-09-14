sudo apt-get update
sudo apt-get install -y curl software-properties-common || sudo apt-get install -y python-software-properties
sudo apt-get -y autoremove
sudo apt-get install -y --allow-unauthenticated python-setuptools python-dev libffi-dev libssl-dev git sshpass tree
sudo apt-get -y install python-pip
sudo pip install ansible cryptography