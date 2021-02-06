output "myapp-repository-URL" {
  value = aws_ecr_repository.myapp.repository_url
}

output "ecs-alb-url" {
  value = aws_alb.ecs_application_lb.dns_name
}

output "version-1" {
  value = var.MYAPP_VERSION
}


output "reg" {
  value = var.AWS_REGION
}
