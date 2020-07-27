# Packer Terraform

* HAProxy
* GitLab Server
* GitLab Runner
* Rancher
* Kubernetes
  * Worker
  * Servers

## Create .pem 

```bash
aws ec2 create-key-pair --key-name aws-ec2 --output text --region us-east-1 > aws-ec2.pem

chmod 400 aws-ec2.pem
```

## SSH

```bash
ssh-keygen -q -f keys/haproxy -C haproxy_ssh_key -N ''
```

## Links

* https://www.jigsawcode.com/packer-recipes-for-ec2-ami/
* https://docs.rightscale.com/faq/How_Do_I_Generate_My_Own_SSH_Key_Pair.html
* https://stackoverflow.com/questions/59440394/where-does-packer-store-the-private-key
