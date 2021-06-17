#!/bin/sh
ansible all -u root -m user -a "name=ansible password=password append=yes groups=wheel state=present" -e ansible_password=password
