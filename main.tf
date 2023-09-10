module "VPC" {
    source = "./Modules/VPC"
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    zones = var.zones
    main_vpc_cidr = var.main_vpc_cidr
    managedby = var.managedby
    count1 = var.count1
    name-vpc = var.name-vpc

    
}

module "Security-Group" {

  
  source = "./Modules/Security-Group"
   vpc_id = "${module.VPC.vpc-id}"
  
      main_vpc_cidr = var.main_vpc_cidr
      managedby = var.managedby

    name-security-group = var.name-security-group
    ssh_cidr_block = var.ssh_cidr_block

}

module "EC2"{
   source = "./Modules/EC2"
   count1 = var.count1
    public_subnets=module.VPC.public_subnets
    security-group-id=module.Security-Group.security-group-id
     

}

module "Load-Balancer"{
   source = "./Modules/Load-Balancer"
   count1 = var.count1
    public_subnets=module.VPC.public_subnets
   vpc_id = "${module.VPC.vpc-id}"

    security-group-id=module.Security-Group.security-group-id
    instatances-ids=module.EC2.ec2-ids
     

}

module "Auto-Scaling"{
   source = "./Modules/Auto-Scaling"

    public_subnets=module.VPC.public_subnets
   

    security-group-id=module.Security-Group.security-group-id
    instatances-ids=module.EC2.ec2-ids
    lb_target_group_nginx = module.Load-Balancer.lb_target_group_nginx
     

}