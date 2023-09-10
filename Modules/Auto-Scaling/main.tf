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

resource "aws_launch_template" "web_template" {

  name_prefix               = "web-tp"
  image_id                  = data.aws_ami.ubuntu.id
  instance_type             = "t2.micro"
  key_name                  =  "project-key"
 vpc_security_group_ids    = [var.security-group-id]
 /* network_interfaces {
    associate_public_ip_address = true
    security_groups =[var.security-group-id]
  }
*/
  user_data     = <<-EOF
    IyEvYmluL2Jhc2gKICAgIGFwdC1nZXQgdXBkYXRlICAgCiAgICBhcHQtZ2V0IGluc3RhbGwgLXkgbmdpbngKICAgIGVjaG8gIlRlcnJhZm9ybSBQcm92aXNpb25lZCBNZSIgfCBzdWRvIHRlZSAvdmFyL3d3dy9odG1sL2luZGV4Lmh0bWwKICAgIHNlcnZpY2Ugbmdpbnggc3RhcnQ=
    EOF
  instance_initiated_shutdown_behavior = "terminate"

 

  # Copy the settings from an existing instance
  #source_instance_id = var.instatances-ids[1]
}

resource "aws_autoscaling_group" "web_asg" {
  name                 = "web-autoscaling-group"
  launch_template {
    id      = aws_launch_template.web_template.id
    version =  aws_launch_template.web_template.latest_version
     
  }
  
  min_size             = 3
  desired_capacity     = 3
  max_size             = 3
  vpc_zone_identifier  = var.public_subnets
  health_check_type    = "EC2"


  tag {
    key                 = "Name"
    value               = "Web Server"
    propagate_at_launch = true
  }

  target_group_arns = [
    var.lb_target_group_nginx
  ]
    

 
}

