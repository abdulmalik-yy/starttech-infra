output "ec2_sg_id" {
  value       = aws_security_group.ec2_sg.id
  description = "The ID of the EC2 security group"
}

output "alb_dns_name" {
  value       = aws_lb.app_lb.dns_name
  description = "The DNS name of the ALB"
}

output "ecr_repository_url" {
  value       = aws_ecr_repository.backend.repository_url
  description = "The URL of the ECR repository"
}

output "ecr_repository_name" {
  value       = aws_ecr_repository.backend.name
  description = "The name of the ECR repository"
}
