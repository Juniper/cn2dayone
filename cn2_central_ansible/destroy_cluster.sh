for node in centraljumphost centralctrl centralworker1 centralworker2; do
virsh destroy $node
virsh undefine $node
rm -f /var/lib/libvirt/images/$node.qcow2
done
