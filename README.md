#Ansible Deployer to automate CN2 deployment 
Idea is to install a multi cluster k8s clutser running CN2 as CNI

Topology we deploy is as desribed in this document under section "Install Multi-Cluster Shared Network CN2": 

https://www.juniper.net/documentation/us/en/software/cn-cloud-native22.4/cn-cloud-native-k8s-install-and-lcm/topics/topic-map/cn-cloud-native-k8s-install-multi-cluster-one-net.html

Upon cloning the repo user will see 2 folders: 

[1] Release -- Contains manifest files for each release of CN2
[2] thelitmustest -- Contains files for deploying the test application on Cn2 cluster for testing

Under Release folder, user will find folders for each release. Once you navigate to particular release folder, there will one folder for each type of cluster deployment, ie, cn2_central_ansible and cn2_ds1_anisble

Both will have 5 yaml playbook to install a cluster from scratch.
Playbooks are marked in numerical order defining the order it needs to be executed in lab.
Playbooks are seperated to define a critical milestone in building the lab.
Seperate README.md file are in each folder defining details about installation.
