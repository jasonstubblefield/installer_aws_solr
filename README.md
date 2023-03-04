# installer_aws_solr_9.1.1

This package easily installs Solr on Ubuntu in AWS. It takes a little setup, but will install a production ready Solr in just a few minutes.

## Prerequisites

* Ansible
* Terraform

## Installation

Change directory to opt

`cd /opt`

Fetch the package from Github.

`git clone https://github.com/jasonstubblefield/installer_aws_solr_9.1.1.git`

Go to the installer folder.

`cd installer_aws_solr_9.1.1`

Edit the Terraform file with yor AWS info: this terraform script has my AWS info in it and will not work.

Change the following values in main.tf:

* subnet_id
* key_name

You might also want to change the:
* region
* ami
* instance_type

Run the terraform installer to spin up the server on EC2.

`terraform init`

`terraform apply`


