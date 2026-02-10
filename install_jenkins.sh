#!/bin/bash


apt update
apt install maven -y
mvn --version


apt install openjdk-11-jdk -y


curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
/usr/share/keyrings/jenkins-keyring.asc > /dev/null
 

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

apt update

apt install openjdk-21-jdk -y
apt install jenkins -y

apt install snapd -y
snap install jenkins --classic
systemctl status snap.jenkins.jenkins


set -e

echo "=============================="
echo "Updating system"
echo "=============================="
sudo apt update -y

echo "=============================="
echo "Installing required packages"
echo "=============================="
sudo apt install -y curl unzip gnupg software-properties-common

echo "=============================="
echo "Installing Terraform (Snap)"
echo "=============================="
if ! command -v terraform &> /dev/null
then
    sudo snap install terraform --classic
    echo "Terraform installed successfully"
else
    echo "Terraform already installed"
fi

echo "=============================="
echo "Installing AWS CLI v2"
echo "=============================="
if ! command -v aws &> /dev/null
then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
    unzip awscliv2.zip
    sudo ./aws/install
    rm -rf aws awscliv2.zip
    echo "AWS CLI installed successfully"
else
    echo "AWS CLI already installed"
fi

echo "=============================="
echo "Verifying installations"
echo "=============================="
terraform version
aws --version

echo "=============================="
echo "Installation completed 🎉"
echo "=============================="








