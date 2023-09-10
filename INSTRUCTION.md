1- Setup and save the terrafom state in s3 bucket called "bucket-manal-terraform"

2- Create vpc module with 3 public subnets and 3 private subnets in 3 different availability zones and create route table to assoiate these subnets to it. The rout table provid access to the vpc gateway to internet.

3- Create security group module to provide ingrees traffic in port 80, 443 and ssh in port 22 from my private ip. The security group provide egress traffic to any where.

4- Create EC2 module to lunch 3 instances in each public subnet and assign the security group to each insttance. Each enstance has ubuntu operating system and have nginx sever insalled in it with the main html page has this sentence "Terraform Provisioned Me"

5- Create load balancer to distrube the traffic from port 80 between these three instances after attaching them to the target group that the load balancer operate for it.

6- Create Auto Scaling group to lunch new 3 instances by using a template which provides that a copy of an exist instance with ubunto operating system and the same installed programmes (nginx) and assign the same exist security group to the new lunched instances. Additionlly, create the key pair via CLI and then assign these new instances to the target groub that the load balancer operate for it.
