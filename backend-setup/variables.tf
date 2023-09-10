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