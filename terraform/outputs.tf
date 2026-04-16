output "ec2_public_ip" {
  value = aws_instance.my_instance["worker-ubuntu"].public_ip
}

output "ec2_username" {
  value = var.instances["worker-ubuntu"].user
}

output "ssh_key_path" {
  value = var.ssh_key_path
}

