
# AWS Terraform Modules Repository

## Overview

This repository contains a collection of reusable Terraform modules for deploying and managing infrastructure on AWS. The modules are designed with best practices in mind, ensuring security, reliability, and scalability.

## Prerequisites

Before using these modules, please ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) 
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials and permissions

## How to Execute the Scripts

- Initialize the Repository with s3 backend
```
terraform init -backend-config backend_configs/tfe.tfbackend
```

- Plan/Appply the terrform scripts
```
 terraform plan -var-file variables/dev.tfvars
 ```
 ```
 terraform apply -var-file variables/dev.tfvars
 ```

## Authors

- [prasannareddychirra](https://www.github.com/prasannareddychirra)
