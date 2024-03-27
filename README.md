# AWS Terraform Modules Repository

## Overview

This repository contains a collection of reusable Terraform modules for deploying and managing infrastructure on AWS. The modules are designed with best practices in mind, ensuring security, reliability, and scalability.

## Prerequisites

Before using these modules, please ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (version x.x.x or later)
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials and permissions

## Repository Structure

The repository is organized as follows:


## Modules

### VPC Module

- **Description**: Creates a VPC with configurable CIDR blocks, enabling DNS support and DNS hostnames.
- **Documentation**: [VPC module documentation](./modules/vpc/README.md).

### Subnet Module

- **Description**: Creates public and private subnets within a specified VPC, allowing for detailed network configurations.
- **Documentation**: [Subnet module documentation](./modules/subnet/README.md).

### NAT Gateway Module

- **Description**: Provisions a NAT Gateway to enable internet access for instances in private subnets.
- **Documentation**: [NAT Gateway module documentation](./modules/nat-gateway/README.md).

### ... (Other Modules)

- **Description**: ...
- **Documentation**: ...

## Usage

To use these modules in your Terraform configurations, specify the module source and the required variables. For example:

```hcl
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  # ... other variables
}

module "public_subnet" {
  source = "./modules/subnet"
  subnet_cidr = "10.0.1.0/24"
  # ... other variables
}


