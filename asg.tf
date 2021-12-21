resource "aws_launch_configuration" "elb_launch_config" {
  image_id      = "ami-0fc15d50d39e4503c"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.project13-sg.id]

  user_data =<<-EOF
              #!/bin/bash
              yum -y install httpd
              echo "Hello, from Terraform" > /var/www/html/index.html
              service httpd start
              chkconfig httpd on
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg_project13" {
  name                 = "autoscaling"
  launch_configuration = aws_launch_configuration.elb_launch_config.id
  min_size             = 2
  max_size             = 5
  health_check_grace_period = 300
  health_check_type = "ELB"
  desired_capacity = 4
  force_delete = true
  vpc_zone_identifier = [aws_subnet.project13-pub-sub1.id,aws_subnet.project13-pub-sub2.id,aws_subnet.project13-pub-sub3.id]

}