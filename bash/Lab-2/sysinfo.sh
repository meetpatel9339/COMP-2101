#!/bin/bash

# Here I am using echo command for blank line which is easiest way to print a blank line.
echo

# Getting hostname using the hostname command
hostname=$(hostname)
echo Report for $hostname

# Using seperator, which is mention in lab by echo command.
echo ===============================

# Getting fully qualified domain name by using hostname command.
fqdn=$(hostname --fqdn)
echo FQDN: $fqdn

# Getting Operating System name and version with the help of awk command.
name_and_version=$(lsb_release -a | awk '/Description:/{print $2, $3, $4}')
echo Operating System name and version: $name_and_version

# Getting IP address of the machine which is used by computer for sending or receiving data.
ip_address=$(hostname -I)
echo IP Address: $ip_address

# Getting free space which is available in root filesystem space ('/') and modifying it in human-friendly number.
free_space=$(df -h / | grep dev | awk '{print $4}')
echo Root Filesystem Free Space: $free_space

# Using seperator which is mention in lab by echo command.
echo ===============================

# Here I am using echo command for blank line which is easiest way to print a blank line.
echo
