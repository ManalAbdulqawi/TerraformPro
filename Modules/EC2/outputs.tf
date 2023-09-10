output "ec2-ids" {
  value = aws_instance.web[*].id
}