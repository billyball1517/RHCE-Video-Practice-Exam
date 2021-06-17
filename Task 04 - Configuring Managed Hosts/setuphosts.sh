#!/bin/sh
ansible all -u root -m user -a "name=ansible append=yes groups=wheel state=present" -e ansible_password=password
ansible all -u root -m shell -a "echo password | passwd ansible --stdin" -e ansible_password=password
ansible all -u root -m shell -a 'echo "ansible ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ansible' -e ansible_password=password

ansible all -m authorized_key -a "user=ansible state=present key='{{ lookup('file','/home/ansible/.ssh/id_rsa.pub')}}'" -e ansible_password=password

ansible all -m ping
