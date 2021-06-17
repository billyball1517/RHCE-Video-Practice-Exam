#!/bin/sh
ansible all -u root -m shell -a "rm -rf /etc/yum.repos.d/*"  -e ansible_password=password
ansible all -u root -m shell -a "subscription-manager clean"  -e ansible_password=password
ansible all -u root -m shell -a "yum clean all"  -e ansible_password=password

ansible all -u root -m yum_repository -a "name=BaseOS description=BaseOS baseurl=ftp://control.example.com/repo/BaseOS gpgcheck=no"  -e ansible_password=password
ansible all -u root -m yum_repository -a "name=AppStream description=AppStream baseurl=ftp://control.example.com/repo/AppStream gpgcheck=no"  -e ansible_password=password
