variable "vpc_id" {
   description = "the ID of the VPC"
  type = string
}

variable "public_subnets" {
   description = "the ID of the VPC"
  type = list(string)
}


variable "count1" {
    description = "count of public and private subnets"
    type=number
  
}

variable "security-group-id" {
     description = "the id of the security group"
    type = string 
}

variable "instatances-ids" {
     description = "the ids of instances contain the nginx server"
    type = list(string )
  
}