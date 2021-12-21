#application load balancer

resource "aws_elb" "project13-alb" {
  name               = "project13-alb"
  subnets = [
    aws_subnet.project13-pub-sub1.id,
    aws_subnet.project13-pub-sub2.id,
    aws_subnet.project13-pub-sub3.id
  ]

  #listener
listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 5
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags = {
    Name = "project13-alb"
  }
}

#Create ALB Target group

resource "aws_lb_target_group" "ELB-TG-project13" {
  name     = "ELB-TG-project13"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.project13-vpc.id
}

#Create ELB Target group attachment for Instance 1/web server

resource "aws_lb_target_group_attachment" "elb-server-attachment1" {
  target_group_arn = aws_lb_target_group.ELB-TG-project13.arn
  target_id        = aws_instance.webserver1-project13.id

  depends_on       = [aws_instance.webserver1-project13]
}

#Create ELB Target group attachment for Instance 2/web server

resource "aws_lb_target_group_attachment" "elb-server-attachment2" {
  target_group_arn = aws_lb_target_group.ELB-TG-project13.arn
  target_id        = aws_instance.webserver2-project13.id

  depends_on       = [aws_instance.webserver2-project13]
}

resource "aws_lb_target_group_attachment" "elb-server-attachment3" {
  target_group_arn = aws_lb_target_group.ELB-TG-project13.arn
  target_id        = aws_instance.webserver3-project13.id

  depends_on       = [aws_instance.webserver3-project13]
}