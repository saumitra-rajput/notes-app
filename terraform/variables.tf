variable "aws_region" {
  description = "AWS region for infrastructure"
  type        = string
  default     = "us-east-2" # edit here
}

# Ports required are: 
#
# SSH - 22
# http - 80 
# HTTPs - 443 optional
# NotesAPP - 8083
# Prometheus - 9090
# Grafana - 3000
# cAdvisor - 8080

variable "ingress_ports" {
    description = "Port rules of the Security Group"
    type        = list(number)
    default     = [22, 80, 443, 8083, 9090, 3000, 8080]
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "c7i-flex.large"  # edit here for k8s
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = "pub_key"
}

variable "volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 20 # edit here for k8s
}

variable "ssh_key_path" {
  description = "Path to the SSH private key"
  type        = string
  default     = "/home/lenovo/.ssh/notesapp" # edit according to yours private key
}


variable "instances" {

  description = "Map of instance names to AMI IDs, SSH users, and OS family"
  
  type = map(object({
    ami       = string
    user      = string
    os_family = string
    instance_type = string
  }))

# You can define multiple using the below format

  # by deafult value to be put in the variable
  default = {
    "worker-ubuntu" = {
      ami       = "ami-07062e2a343acc423" # Ubuntu Server 24.04 LTS
      user      = "ubuntu"
      os_family = "ubuntu"
      instance_type = "t3.micro" # Edit here for k8s
    }

    #"worker-amazon" = {
    #  ami       = "ami-0a1b6a02658659c2a" # Amazon Linux 2023 — update for your region
    #  user      = "ec2-user"
    #  os_family = "amazon"
    #  instance_type = "t3.micro"
    #}
  }
}
