# AWS Terraform Modules

This repository has reusable modules for AWS Infrastructure with examples.

## ECR

Docker images are stored in AWS ECR.

```hcl
module "ecr" {
  source = "git::https://github.com/AbulSyed/aws-terraform-modules.git//ecr"

  name    = "my-ecr-repo"
  service = "auth"
  env     = "dev"
}
```

## VPC

Isolated virtual network in AWS where your compute resources live.

```hcl
module "vpc" {
  source = "git::https://github.com/AbulSyed/aws-terraform-modules.git//vpc"

  vpc_name                  = "My VPC"
  vpc_cidr                  = "10.0.0.0/16"
  public_subnets            = local.public_subnets
  private_subnets           = local.private_subnets
  internet_gateway_name     = "My Internet Gateway"
  public_rt_destination_ip  = "0.0.0.0/0"
  public_rt_name            = "My Public Route Table"
  nat_eip_name              = "My NAT EIP"
  nat_gateway_name          = "My NAT GW"
  private_rt_destination_ip = "0.0.0.0/0"
  private_rt_name           = "My Private Route Table"
}
```

```hcl
locals {
  public_subnets = {
    az1 = {
      cidr = "10.0.0.0/24"
      az   = "eu-west-2a"
    }
    az2 = {
      cidr = "10.0.1.0/24"
      az   = "eu-west-2b"
    }
  }

  private_subnets = {
    az1 = {
      cidr = "10.0.2.0/24"
      az   = "eu-west-2a"
    }
    az2 = {
      cidr = "10.0.3.0/24"
      az   = "eu-west-2b"
    }
  }
}
```

### CIDR block

Defines a range of IP addresses your network can support for your resources. Everything inside your VPC - like EC2, ECS, RDS gets an IP from this range.

### Subnets

Section of VPC which organises public and private services. Public subnets can be reached from outside like load balancers. Private subnets can’t be accessed from outside the network e.g. ECS.

### Internet Gateway

Internet Gateway allows inbound & outbound traffic between VPC and the internet for resources in subnets that are routed and allowed by security groups.

### NAT Gateway

Allows resources in a private subnet to access the internet.

### Route tables

Used to direct traffic flow.
