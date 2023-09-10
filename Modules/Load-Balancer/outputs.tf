output "load_balancer_id" {

   value=aws_lb.app.id 
}

output "lb_target_group_nginx" {
  value=aws_lb_target_group.nginx.arn
}

