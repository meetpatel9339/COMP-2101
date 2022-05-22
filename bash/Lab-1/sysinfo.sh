#!/bin/bash

# Get the hostname using the hostname command
hostname=$(hostname)
echo Host Name: $hostname

domainname=$(domainname -d)
echo Domain Name: $domainname

name_and_version=$(lsb_release -a | awk '/Description:/{print $2, $3, $4}')
echo Operating System name and version: $name_and_version

pretty_name=$(cat /etc/*-release | grep 'PRETTY_NAME=')
echo $pretty_name

ip_address=$(hostname -I | awk '{print $1}')
echo IP Addresses: 
echo $ip_address

echo Root Filesystem Status:
header=$(df | awk '{print $1, $2, $3, $4, $5, $6}' | head -1)
result=$(df | awk '{print $1, $2, $3, $4, $5, $6}' | grep '/dev/sda1')
echo $header
echo $result
