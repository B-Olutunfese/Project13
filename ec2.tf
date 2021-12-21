#instances 

resource "aws_instance" "webserver1-project13" {
  ami           = var.project13-ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.project13-sg.id]
  subnet_id = aws_subnet.project13-pub-sub1.id
  availability_zone = "eu-west-2a"

  tags = {
    Name = "HelloWorld-user"
  }
}
resource "aws_instance" "webserver2-project13" {
  ami           = var.project13-ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.project13-sg.id]
  subnet_id = aws_subnet.project13-pub-sub2.id
  availability_zone = "eu-west-2b"

  tags = {
    Name = "HelloWorld-user"
  }
}

resource "aws_instance" "webserver3-project13" {
  ami           = var.project13-ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.project13-sg.id]
  subnet_id = aws_subnet.project13-pub-sub3.id
  availability_zone = "eu-west-2c"

  tags = {
    Name = "HelloWorld"
  }
}