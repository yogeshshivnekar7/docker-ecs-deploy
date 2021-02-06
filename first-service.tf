resource "aws_ecs_service" "my_first_service" {
  name            = "my-first-service"                             # Naming our first service
  cluster         = aws_ecs_cluster.my_first_cluster.id             # Referencing our created Cluster
  task_definition = aws_ecs_task_definition.my_first_task.arn # Referencing the task our service will spin up
  launch_type     = "FARGATE"
  desired_count   = 1 # Setting the number of containers we want deployed to 3

  load_balancer {
  target_group_arn = aws_lb_target_group.ecs_target_group.arn # Referencing our target group
  container_name   = aws_ecs_task_definition.my_first_task.family
  container_port   = 3000 # Specifying the container port
  }

  network_configuration {
    subnets          = [aws_subnet.Public_SN_1.id, aws_subnet.Public_SN_2.id]
    security_groups      = [aws_security_group.ecs-sg.id]
    assign_public_ip = true # Providing our containers with public IPs
  }
}
