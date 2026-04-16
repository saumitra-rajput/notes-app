# ☁️ Terraform Setup for Notes App Infrastructure

This directory contains Terraform configuration to provision AWS infrastructure for the Notes App.

---

## 📁 Structure

```
terraform/
├── ec2.tf                # EC2 instance configuration
├── key_pair.tf          # SSH key pair setup
├── security_group.tf    # Security group rules
├── providers.tf         # AWS provider config
├── variables.tf         # Input variables
├── outputs.tf           # Outputs (IP, username, etc.)
├── terraform.tfstate    # State file (auto-generated)
├── notesapp.pub         # Public SSH key
```

---

## ⚙️ Prerequisites

* AWS CLI configured (`aws configure`)
* Terraform installed
* SSH private key available:

  ```
  /home/lenovo/.ssh/notesapp
  ```

---

## 🚀 Step 1: Initialize Terraform

```bash
cd terraform
terraform init
```

---

## 🚀 Step 2: Create Infrastructure

```bash
terraform apply
```

👉 This will:

* Create EC2 instance(s)
* Configure security groups (ports: 22, 80, 8083, 9090, 3000, etc.)
* Upload your SSH public key
* Attach storage volume

---

## 📤 Outputs

After successful apply, Terraform will show:

```
ec2_public_ip = "x.x.x.x"
ec2_username  = "ubuntu"
```

---

## 🔍 Check Outputs Anytime

```bash
terraform output
```

Or specific values:

```bash
terraform output -raw ec2_public_ip
terraform output -raw ec2_username
```

---

## 🔗 Next Step (Ansible)

Once infrastructure is ready:

➡️ Go to:

```
../ansible/
```

Follow instructions in:

```
ansible/README.md
```

👉 Flow:

* Generate inventory
* Test connection
* Run playbook to deploy app

---

## 🧹 Destroy Infrastructure

To delete all resources:

```bash
terraform destroy
```

👉 This will:

* Terminate EC2 instance(s)
* Remove security groups
* Clean up all created resources

---

## 🧠 Notes

* Make sure your **SSH key path is correct** in variables
* Do NOT commit:

  ```
  terraform.tfstate
  terraform.tfstate.backup
  ```
* If key pair already exists, change `key_name` to avoid conflict

---

## 🔥 One-Line Full Workflow

```bash
terraform apply -auto-approve && cd ../ansible && ./generate_inventory.sh && ansible-playbook -i inventory.ini playbooks/noteapp.yml
```

---

## 📌 Summary

Terraform → Creates AWS Infrastructure
Ansible → Configures Server & Deploys App

---

💡 This project demonstrates a complete **Infrastructure as Code + Configuration Management workflow**

