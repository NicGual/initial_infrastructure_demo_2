#!/bin/bash
echo "hola hello"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt -y  update
echo "add repo java"
sudo add-apt-repository ppa:openjdk-r/ppa -y
echo "install java"
sudo apt -y install openjdk-11-jdk
echo "install jenkins"
sudo apt-get -y install jenkins
echo "Acti jenkins"
sudo systemctl start jenkins
echo "Jenkins initial admin password"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

