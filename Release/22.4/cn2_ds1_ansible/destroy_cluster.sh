for node in ds1jumphost ds1ctrl ds1worker1 ds1worker2; do
virsh destroy $node
virsh undefine $node
rm -f /var/lib/libvirt/images/$node.qcow2
done
