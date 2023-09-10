region = "eu-west-2"

bucket-name= "bucket-manal-terraform"
table-name = "first-dynamodb-table"

main_vpc_cidr = "10.0.0.0/16"

 public_subnet_cidrs=["10.0.0.0/20","10.0.16.0/20","10.0.32.0/20"]
 private_subnet_cidrs=["10.0.48.0/20","10.0.64.0/20", "10.0.80.0/20"]

 zones=["eu-west-2c","eu-west-2a","eu-west-2b"]
 count1 = 3
 managedby = "terraform-team1"
 name-vpc="general-vpc"
 name-security-group="general-secrity-group"

 ssh_cidr_block="31.94.11.217/32"
 

  
