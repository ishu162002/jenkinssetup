#!/bin/bash
# Script to install Jenkins on Ubuntu EC2

# Update system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Java (Jenkins requires Java)
sudo apt-get install -y fontconfig openjdk-17-jre

# Verify Java installation
java -version

# Add Jenkins repo key and source
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update apt and install Jenkins
sudo apt-get update -y
sudo apt-get install -y jenkins

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Check Jenkins status
sudo systemctl status jenkins

