#!/usr/bin/env bash

echo " "
echo "provision.sh: Entering Shell Provisoning"

echo " "
/bin/rm /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel-testing.repo
yum makecache fast
yum install deltarpm -y
yum install wget -y

/bin/mv /etc/yum.repos.d/public-yum-ol7.repo /etc/yum.repos.d/public-yum-ol7.repo.orig
wget -q http://yum.oracle.com/public-yum-ol7.repo -P /etc/yum.repos.d

yum install yum-utils -y
yum-config-manager --enable ol7_addons
yum-config-manager --enable ol7_software_collections
yum-config-manager --enable ol7_developer
yum-config-manager --enable ol7_developer_EPEL

yum makecache fast

echo " "
/bin/sed -i.bak -e 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

echo " "
ip addr show

date +"%F %T" > /etc/git-creation-timestamp.txt
echo " "
cat /etc/git-creation-timestamp.txt
echo " "
echo "provision.sh: Exiting Shell Provisoning"
