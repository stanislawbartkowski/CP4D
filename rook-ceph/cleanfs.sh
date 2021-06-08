for worker in $(oc get node -o name -l node-role.kubernetes.io/worker | sed 's/node\///')
do 
  echo $worker
  ssh core@$worker sudo lsblk -l
  ssh core@$worker sudo dd if=/dev/zero of=/dev/vdb bs=1M count=2
  ssh core@$worker sudo dd if=/dev/zero of=/dev/vdc bs=1M count=2
done
