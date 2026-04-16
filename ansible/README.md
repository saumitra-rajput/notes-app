# 🚀 Ansible Setup for Notes App Deployment

This directory contains Ansible configuration to automate server setup and deploy the Notes App using Docker.

---

## 📁 Structure

```
ansible/
├── generate_inventory.sh   # Script to generate inventory from Terraform outputs
├── inventory.ini           # Generated inventory file
└── playbooks/
    └── noteapp.yml         # Main playbook
```

---

## ⚙️ Prerequisites

* Terraform applied successfully (EC2 instance is running)
* SSH key available at:

  ```
  /home/lenovo/.ssh/notesapp
  ```
* Ansible installed on your local machine

---

## 🧾 Step 1: Generate Inventory File

After Terraform is successfully applied, generate the Ansible inventory:

```bash
cd ansible
chmod +x generate_inventory.sh   # run once if needed
./generate_inventory.sh
```

This will create:

```
inventory.ini
```

---

## 🔌 Step 2: Test Connection

Verify Ansible can connect to your EC2 instance:

```bash
ansible -i inventory.ini notesapp -m ping
```

Expected output:

```
SUCCESS => "ping": "pong"
```

---

## ▶️ Step 3: Run Playbook

Run the deployment playbook:

```bash
ansible-playbook -i inventory.ini playbooks/noteapp.yml
```

---

## 🛠️ What the Playbook Does

The playbook automates the following steps:

* ✅ Installs Docker and Docker Compose
* ✅ Installs Git
* ✅ Starts and enables Docker service
* ✅ Adds user to Docker group
* ✅ Clones application repository
* ✅ Runs application using Docker Compose
* ✅ Displays running containers

---

## 🧠 Notes

* Make sure port **22 (SSH)** is open in Security Group
* If connection fails, check SSH manually:

  ```bash
  ssh -i ~/.ssh/notesapp ubuntu@<EC2_PUBLIC_IP>
  ```
* Ensure correct permissions:

  ```bash
  chmod 400 ~/.ssh/notesapp
  ```

---

## 🔥 One-Line Flow (Optional)

```bash
terraform apply -auto-approve && cd ansible && ./generate_inventory.sh && ansible-playbook -i inventory.ini playbooks/noteapp.yml
```

---

## 📌 Summary

Terraform → Creates Infrastructure
Script → Generates Inventory
Ansible → Configures & Deploys Application

---

💡 This setup demonstrates a complete **DevOps workflow using Terraform + Ansible + Docker**

