variable "public_subnets" {
   description = "the ID of the VPC"
  type = list(string)
}



variable "security-group-id" {
     description = "the id of the security group"
    type = string 
}

variable "instatances-ids" {
     description = "the ids of instances contain the nginx server"
    type = list(string )
  
}

variable "lb_target_group_nginx" {
    description = "the arn of the nginx target group"
    type = string 
}

