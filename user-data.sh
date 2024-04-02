#!/usr/bin/env bash
sudo echo "<h1>Hello World!</h1>" > /var/www/html/index.html 
sudo yum update -y 
sudo yum install -y httpd.x86_64
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent