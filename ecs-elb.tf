resource "aws_alb" "ecs_application_lb" {
  name               = "ecs-elb" # Naming our load balancer
  load_balancer_type = "application"
  subnets = [aws_subnet.Public_SN_1.id, aws_subnet.Public_SN_2.id]
  # Referencing the security group
  security_groups = ["${aws_security_group.ecs_lb_sg.id}"]
}

# Creating a security group for the load balancer:
resource "aws_security_group" "ecs_lb_sg" {
  vpc_id      = aws_vpc.my_vpc.id
  name        = "ecs_lb_sg"
  description = "security group for ecs load balancer"
  ingress {
    from_port   = 80 # Allowing traffic in from port 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic in from all sources
  }

  egress {
    from_port   = 0 # Allowing any incoming port
    to_port     = 0 # Allowing any outgoing port
    protocol    = "-1" # Allowing any outgoing protocol 
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }
  tags = {
    Name = "ECS_LB_SG"
  }
}
