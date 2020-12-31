#!/bin/bash -x

cd /root/

yum install -y vim tang
systemctl enable tangd.socket --now

tang-show-keys
echo ""

export tang_ip=$(hostname -I | cut -d' ' -f1)
export tang_thumbprint=$(tang-show-keys)
envsubst < nbde-47.ign.template > nbde-47-1.ign
