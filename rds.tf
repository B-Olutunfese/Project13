resource "aws_db_instance" "my-project13sql-db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin1"
  password             = "admin124"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.my-project13-rds-db-subnet.id
}

#Create RDS subnet
resource "aws_db_subnet_group" "my-project13-rds-db-subnet" {
  name       = "my-project13-rds-db-subnet"
  subnet_ids = [aws_subnet.project13-pub-sub1.id,aws_subnet.project13-pub-sub2.id,aws_subnet.project13-pub-sub3.id]

  tags = {
    Name = "my-project13-rds-db-subnet"
  }
}

resource "aws_security_group" "my-project13-sg-rds" {
  name        = "my-project13-sg-rds"
  description = "Allow inbound traffic db"
  vpc_id      = aws_vpc.project13-vpc.id
}

resource "aws_security_group_rule" "my-project13-rds-sg-rule" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"
  ]

  security_group_id = aws_security_group.my-project13-sg-rds.id
}

resource "aws_security_group_rule" "outbound_rule" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = aws_security_group.my-project13-sg-rds.id
  cidr_blocks       = ["0.0.0.0/0"
  ]
} 