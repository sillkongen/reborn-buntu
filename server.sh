#!/bin/sh

apt-get update ; apt-get upgrade -y

apt-get install -y docker.io mhddfs xfsprogs openssh-server

systemctl enable ssh

#systemctl set-default multi-user
systemctl set-default multi-user.target
# Firewall entries
ufw allow ssh
ufw --force enable
# Samba
ufw allow proto udp to any port 137 from 192.168.1.0/24
ufw allow proto udp to any port 138 from 192.168.1.0/24
ufw allow proto tcp to any port 139 from 192.168.1.0/24
ufw allow proto tcp to any port 445 from 192.168.1.0/24

# Add mounter for merged volumes.
# mhddfs

# Nebula
# Add certificates - startup process - and configuration

cp 01-netcfg.yaml /etc/netplan/01-network-manager-all.yaml

netplan apply

shutdown now -r

