Setup servers for replication via aws:

```
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""

aws ec2 run-instances \
    --image-id ami-0f1026b68319bad6c \
    --key-name key \
    --instance-type t2.micro \
    --region eu-central-1 \
    --security-group-ids sg-4df2c82b \
    --count 2
```

Example playbook and inventory:
```
---
- name: Install postgresql
  hosts: postgresql-replication-servers
  become: true
  roles:
    -role: postgresql-replication.yml
```

Inventory:
```
```
[postgresql-replication-master]
master ansible_host= ansible_port=22 ansible_user=

[postgresql-replication-slave]
slave1 ansible_host= ansible_port=22 ansible_user=
slave2 ansible_host= ansible_port=22 ansible_user=

[postgresql-replication-servers:children]
postgresql-replication-slave
postgresql-replication-master                                    
```
