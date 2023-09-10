resource "aws_vpc" "main" {            # Creating VPC here
  cidr_block       = var.main_vpc_cidr # Defining the CIDR block use 10.0.0.0/24 for demo
 instance_tenancy = "default"
 enable_dns_support = true
 enable_dns_hostnames = true
  tags={
    Name=var.name-vpc
  managedby=var.managedby}
}

resource "aws_internet_gateway" "IGW" { # Creating Internet Gateway
  vpc_id = aws_vpc.main.id              # vpc_id will be generated after we create VPC
}

resource "aws_subnet" "public_subnets" {
  vpc_id            = aws_vpc.main.id
  count             = var.count1
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.zones[count.index]
   tags = {
    Name = "Public-Subnet ${count.index + 1}"
  }
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnets" {
  vpc_id            = aws_vpc.main.id
  count             = var.count1
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.zones[count.index]
  tags = {
    Name = "Private-Subnet ${count.index + 1}"
  }
}

resource "aws_route_table" "PublicRT-1" { # Creating RT for Public Subnet
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0" # Traffic from Public Subnet reaches Internet via Internet Gateway
    gateway_id = aws_internet_gateway.IGW.id
  }
}
#Route table Association with Public Subnet’s
resource "aws_route_table_association" "PublicRTassociation" {
  count = var.count1
  subnet_id = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.PublicRT-1.id
}
#Route table Association with Private Subnet’s
resource "aws_route_table_association" "PrivateRTassociation" {
  count     = var.count1
  subnet_id = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.PublicRT-1.id
}