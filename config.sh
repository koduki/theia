#!/bin/bash

mount -o discard,defaults /dev/sdb /mnt/disks/docker_data
cat <<EOF > /etc/docker/daemon.json
{
    "data-root": "/mnt/disks/docker_data",
    "live-restore": true,
    "storage-driver": "overlay2",
    "mtu": 1460
}
EOF
systemctl restart docker
mkdir -p /var/theia
chmod 777 /var/theia
