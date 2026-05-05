#!/bin/bash
VM_NAME="debian-k3s"
IP=$(VBoxManage guestproperty get "$VM_NAME" "/VirtualBox/GuestInfo/Net/1/V4/IP" 2>/dev/null | awk '{print $2}')
if [ -z "$IP" ] || [ "$IP" = "value" ]; then
  echo "IP non dispo, connecte toi a la VM et tape : ip a"
else
  echo "IP de la VM : $IP"
  echo "$IP" > ~/devops-finale/vm-ip.txt
fi
