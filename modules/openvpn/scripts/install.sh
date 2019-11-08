#!/bin/bash

# set forwarding and other os options
echo 1 > /proc/sys/net/ipv4/ip_forward

# install package
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y openvpn easy-rsa
