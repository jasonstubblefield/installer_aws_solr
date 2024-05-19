# installer_aws_solr

This package easily installs Solr on Ubuntu in AWS. It takes a little setup, but will install a production ready Solr in just a few minutes.

Solr is installed in single server mode (not cloud). This installation is suitable for a lab or for a website with light traffic.  

Please remember data in solr should be treated as ephemeral and should also be stored somewhere else.

## Prerequisites

* Ansible
* Terraform

## Installation

Change directory to opt

`cd /opt`

Fetch the package from Github.

`git clone https://github.com/jasonstubblefield/installer_aws_solr.git`

Go to the installer folder.

`cd installer_aws_solr`

Copy the terraform.vars.example file to terraform.vars .

`cp terraform.vars.example terraform.vars`

Edit the terraform.tfvars with your AWS info. Using the defaults will resiult in an error.

Change the following values:

* subnet_id
* key_name

You might also want to change:
* region
* ami
* instance_type

Run the terraform installer to spin up the server on EC2.

`terraform init`

`terraform apply`

Copy the inventory.example file to inventory.

`cp inventory.example inventory`

Update the inventory file with the public IP address from the AWS server you spun up.

Install Solr with Ansible:

`ansible-playbook -i inventory ./install_solr_ubuntu.yml`

Use an SSL tunnel to see the solr dashboard:

`ssh -i "Solr.pem" ubuntu@ec2-1-2-3-4.compute-1.amazonaws.com -L 8984:localhost:8983`

Visit the Solr dashboard at `http://localhost:8984`






