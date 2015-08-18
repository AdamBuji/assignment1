#!/bin/bash
VBoxManage createvm --name "ubuntu-assignment-vm" --register 
VBoxManage modifyvm "ubuntu-assignment-vm" --memory 512 --acpi on --boot1 dvd --nic1 bridged --bridgeadapter1 eth0 --ostype Ubuntu
VBoxManage createvdi --filename ~/VirtualBox\ VMs/ubuntu-assignment-vm/ubuntu-assignment-vm-disk01.vdi --size 8192
VBoxManage storagectl "ubuntu-assignment-vm" --name "IDE Controller" --add ide
VBoxManage storageattach "ubuntu-assignment-vm" --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium ~/VirtualBox\ VMs/ubuntu-assignment-vm/ubuntu-assignment-vm-disk01.vdi
VBoxManage storageattach "ubuntu-assignment-vm" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium /iso/ubuntu-12.04.1-server-i386.iso
