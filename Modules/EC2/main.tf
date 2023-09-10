data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}
resource "aws_key_pair" "my-key-pair" {
  key_name   = "my-key-pair-new"
  public_key = file("/home/manal/northcoders/projects/ce-terraform-project/Modules/EC2/my-key-pair.pub")
}


resource "aws_instance" "web" {
  count         = 0 #var.count1
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
vpc_security_group_ids = [var.security-group-id]
  subnet_id     = var.public_subnets[count.index]
  tags = {
    Name = "EC2 ${count.index}"
  }

  key_name = aws_key_pair.my-key-pair.key_name
  associate_public_ip_address = true
  user_data     = <<-EOF
    #!/bin/bash
    apt-get update   
    apt-get install -y nginx
    echo "Terraform Provisioned Me" | sudo tee /var/www/html/index.html
    service nginx start
    EOF


}


