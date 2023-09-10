resource "aws_lb" "app" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security-group-id]
  subnets            = var.public_subnets[*]

  tags = {
    Name = "My ALB"
  }
  }

resource "aws_lb_target_group" "nginx" {
  name_prefix   = "TF"
  port          = 80
  protocol      = "HTTP"
  vpc_id        = var.vpc_id
  health_check {
    path  = "/"
    port  = "80"
    protocol = "HTTP"
  }
}

resource "aws_lb_listener" "nginx_listener" {
  load_balancer_arn = aws_lb.app.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.nginx.arn
  }
}

resource "aws_lb_target_group_attachment" "nginx_attach" {
  count =0// var.count1
  target_group_arn = aws_lb_target_group.nginx.arn
  target_id =var.instatances-ids[count.index]
  port = 80
}