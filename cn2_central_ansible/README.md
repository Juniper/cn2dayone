#This script is to automate CN2 deployment
#Usage:- ansible-playbook -i inventory <playbook.yaml name>
#Prerequisite :- Change the inventory.yaml to the IP from your environment

##1 1play_vm_creation.yaml
Usage:- ansible-playbook -i inventory 1play_vm_creation.yaml
Tasks:- 
Update /etc/hosts on local host from Inventory file
Install VM & customize it 
Start the VM

What to Expect :- 
4 network files created in the folder, files should have the correct IP address as per the environment populated from inventory file 
4 VM images are customized and saved in /var/lib/libvirt/images
4 VM gets spawned and should be in running state

##2 2Play_resize_vms.yaml
Usage:- ansible-playbook -i inventory 2Play_resize_vms.yaml
Tasks:- 
Update /etc/hosts for all the VM with info about each other VM's
Expand the partition and resize
Update DNS 

What to expect :- All 4 VMs updated with its size 

##3 3Play_prepare_jumphost.yaml
Usage:- ansible-playbook -i inventory 3Play_prepare_jumphost.yaml
Tasks:- 
Install packages like ansible, sshpass,kubectl, helm
Clone Kubespray
Make changes to kubespray main.yaml file
SSH keys copy


What to expect :- Jumphost should have all packages installed and should be able to login without passowrd into cluster nodes

##4 4Play_build_cluster_without_cni.yaml
Usage:- ansible-playbook -i inventory 4Play_build_cluster_without_cni.yaml
Tasks :- 
Install k8s cluster withiout CNI


What to expect :- K8s cluster without CNI
Command "kubectl get nodes -A -o wide" should show nodes in NotReady state because CNI isnt installed yet

##5 5Play_deploy_CN2_as_CNI.yaml
Usage:- ansible-playbook -i inventory 5Play_deploy_CN2_as_CNI.yaml
Tasks:- 
Docker install
& ask for docker credentials
Clone git repo for CN2 version manifests
Deploy CN2 on cluster deployed in previous step

What to expect :- k8s cluster installed with CN2 and ready to use
