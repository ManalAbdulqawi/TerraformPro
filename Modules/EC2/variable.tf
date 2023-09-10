variable "public_subnets" {
   description = "the ID of the public subnets"
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



