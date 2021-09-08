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
ufw allow proto tcp to any port 139 from 192.168.1.0/24flexfw
ufw allow proto tcp to any port 445 from 192.168.1.0/24

# Add mounter for merged volumes.
# mhddfs

# Nebula
# Add certificates - startup process - and configuration

# Static IP configuration (Network Manager for Ubuntu desktop and networkd for server)
cp 01-netcfg.yaml /etc/netplan/01-network-manager-all.yaml
netplan apply

#Plex Firewall rules
cp flexfw /etc/ufw/applications.d/plexmediaserver
ufw app update plexmediaserver
ufw allow plexmediaserver-all

echo "Verify your configuration, if you feel lucky then REBOOT!"
# shutdown now -r

