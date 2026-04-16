#!/bin/bash

# Get values from Terraform (from terraform folder)
IP=$(terraform -chdir=../terraform output -raw ec2_public_ip)
USER=$(terraform -chdir=../terraform output -raw ec2_username)
KEY=$(terraform -chdir=../terraform output -raw ssh_key_path)

# Create inventory inside ansible folder
echo "[notesapp]" > inventory.ini
echo "$USER ansible_host=$IP" >> inventory.ini
echo "$USER ansible_user=$USER" >> inventory.ini

echo "" >> inventory.ini
echo "[notesapp:vars]" >> inventory.ini
echo "ansible_python_interpreter=/usr/bin/python3" >> inventory.ini
echo "ansible_ssh_private_key_file=$KEY" >> inventory.ini
echo "ansible_host_key_checking=false" >> inventory.ini

echo "✅ inventory.ini created inside ansible folder"
