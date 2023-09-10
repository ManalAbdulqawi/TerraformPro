variable "region" {
    type=string
    description = "The region of the terraform infrastructure"
  
}


variable "bucket-name" {
    type=string
    description = "The name of the buket"
  
}

variable "table-name" {
    type = string
    description = "dynamo table name"
}


 variable "main_vpc_cidr" {
    type=string
    description = "the main vpc"
    
 }


variable "public_subnet_cidrs" {
  description = "The cidr range for public for Subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "The cidr range for private Subnets"
  type        = list(string)
}

variable "zones" {
  description = "The zones of the subnets"
  type        = list(string)
}

variable "count1" {
    description = "count of public and private subnets"
    type=number
  
}



variable "managedby" {
    description ="How create and manage this resources"
    type = string
  
}

variable "name-vpc" {
  description = "the name of the VPC"
  type = string
  
}

variable "ssh_cidr_block" {
  type = string
  default = "0.0.0.0/0"
  description = "CIDR block for SSH access"
}

variable "name-security-group" {
  description = "the name of the security group"
  type = string
  
}
