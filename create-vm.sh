#!/bin/bash

VM_NAME="debian-k3s"
ISO_PATH="$HOME/devops-finale/debian.iso"

VBoxManage createvm --name "$VM_NAME" --ostype Debian_64 --register
VBoxManage modifyvm "$VM_NAME" --memory 2048 --cpus 2
VBoxManage modifyvm "$VM_NAME" --nic1 nat
VBoxManage modifyvm "$VM_NAME" --nic2 hostonly --hostonlyadapter2 "VirtualBox Host-Only Ethernet Adapter"
VBoxManage createhd --filename "$HOME/VirtualBox VMs/$VM_NAME/$VM_NAME.vdi" --size 20480
VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$HOME/VirtualBox VMs/$VM_NAME/$VM_NAME.vdi"
VBoxManage storagectl "$VM_NAME" --name "IDE Controller" --add ide
VBoxManage storageattach "$VM_NAME" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "$ISO_PATH"
VBoxManage modifyvm "$VM_NAME" --boot1 dvd --boot2 disk

echo "VM creee avec succes !"
