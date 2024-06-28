# installer_aws_solr

This package easily installs Solr on Ubuntu in AWS. It takes a little setup, but will install a production ready Solr in just a few minutes.

Solr is installed in single server mode (not cloud). This installation is suitable for a lab or for a use case with light to medium traffic.  

Please remember data in Solr should be treated as ephemeral and should also be stored somewhere else.

## Prerequisites

* Ansible
* Terraform
* AWS Account & Credentials

## Installation

Change directory to opt

`cd /opt`

Fetch the installer_aws_solr package from Github.

`git clone https://github.com/jasonstubblefield/installer_aws_solr.git`

Go to the installer folder.

`cd installer_aws_solr`

Copy the terraform.vars.example file to terraform.vars .

`cp terraform.vars.example terraform.vars`

Edit the `terraform.tfvars` with your AWS info. Using the defaults will resiult in an error.

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

Install Solr with Ansible *this can take 5-10 minutes on smaller instances:

`ansible-playbook -i inventory ./install_solr_ubuntu.yml`

Use an SSL tunnel to see the Solr dashboard:

`ssh -i "Solr.pem" ubuntu@ec2-1-2-3-4.compute-1.amazonaws.com -L 8984:localhost:8983`

Visit the Solr dashboard at `http://localhost:8984`

Please note, the reason I have mapped the remote port (8983) to 8984 on the local machine is because I already have Solr running on my local machine on port 8983. 

Destroy your instance. If you are not planning to use this for long term usage make sure you destroy your server:

`terraform destroy`

Confirm your instance has been destroyed in the AWS dashboard.

Now you can have as many basic Solr servers in AWS as you want.






