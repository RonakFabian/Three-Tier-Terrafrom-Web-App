resource "aws_launch_template" "web_server" {
  name_prefix   = "web-server-"
  image_id      = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID
  instance_type = "t2.micro"

  user_data = base64encode(file("${path.module}/user_data.sh"))

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.web_sg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "application-server"
    }
  }
  network_interfaces {
    security_groups = [aws_security_group.server_sg.id]
  }
}

resource "aws_autoscaling_group" "server_asg" {
  vpc_zone_identifier = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  desired_capacity    = 2
  min_size            = 2
  max_size            = 4
  launch_template {
    id      = aws_launch_template.server.id
    version = "$Latest"
  }
}

resource "aws_lb" "server_alb" {
  name               = "server-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.server_sg.id]
  subnets            = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}

resource "aws_lb_target_group" "server_tg" {
  name     = "server-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "server_listener" {
  load_balancer_arn = aws_lb.server_alb.arn
  port              = 3000
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.server_tg.arn
  }
}
