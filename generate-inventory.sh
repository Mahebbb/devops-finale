#!/bin/bash
VM_IP=$(cat ~/devops-finale/vm-ip.txt 2>/dev/null)
if [ -z "$VM_IP" ]; then
  read -p "Entre l'IP de ta VM : " VM_IP
  echo "$VM_IP" > ~/devops-finale/vm-ip.txt
fi
mkdir -p ~/devops-finale/ansible
cat > ~/devops-finale/ansible/inventory.ini << INVENTORY
[k3s]
debian-k3s ansible_host=$VM_IP ansible_user=devops ansible_ssh_private_key_file=~/.ssh/id_rsa

[k3s:vars]
ansible_python_interpreter=/usr/bin/python3
INVENTORY
echo "Inventaire genere :"
cat ~/devops-finale/ansible/inventory.ini
