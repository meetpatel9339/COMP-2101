#!/bin/bash

# Getting hostname using the hostname command
hostname=$(hostname)
echo Host Name: $hostname

# Getting DNS domain name using domainname command
domainname=$(domainname -d)
echo Domain Name: $domainname

# Getting Operating System name and version with the help of awk command 
name_and_version=$(lsb_release -a | awk '/Description:/{print $2, $3, $4}')
echo Operating System name and version: $name_and_version

# Getting Pretty name here with the help of grep command
pretty_name=$(cat /etc/*-release | grep 'PRETTY_NAME=')
echo $pretty_name

# Getting all ip address here
ip_address=$(hostname -I)
echo IP Addresses: 
echo $ip_address

# Getting File Status here
echo Root Filesystem Status:
header=$(df | awk '{print $1, $2, $3, $4, $5, $6}' | head -1)
result=$(df | awk '{print $1, $2, $3, $4, $5, $6}' | grep '/dev/sda1')
echo $header
echo $result
