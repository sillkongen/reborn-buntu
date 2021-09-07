#!/bin/sh

apt-get update ; apt-get upgrade -y

apt-get install docker.io mhddfs xfsprogs 

systemctl set-default multi-user

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


