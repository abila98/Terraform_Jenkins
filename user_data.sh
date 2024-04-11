#!/bin/bash

# Update package repositories and install Java 8
sudo yum update -y
sudo yum install java-11-amazon-corretto-devel -y
# Download and install Jenkins repository configuration
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import the GPG key for the Jenkins repository
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# Install Jenkins
sudo yum install -y jenkins

# Start and enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

