#vpc

resource "aws_vpc" "project13-vpc" {
  cidr_block       = var.project13-vpc-cidr
  instance_tenancy = "default"

  tags = {
    Name = "project13-vpc"
  }
}

#public-subnets

resource "aws_subnet" "project13-pub-sub1" {
  vpc_id     = aws_vpc.project13-vpc.id
  cidr_block = var.project13-pub-sub1-cidr
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "project13-pub-sub1"
  }
}

resource "aws_subnet" "project13-pub-sub2" {
  vpc_id     = aws_vpc.project13-vpc.id
  cidr_block = var.project13-pub-sub2-cidr
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "project13-pub-sub2"
  }
}

resource "aws_subnet" "project13-pub-sub3" {
  vpc_id     = aws_vpc.project13-vpc.id
  cidr_block = var.project13-pub-sub3-cidr
  availability_zone = "eu-west-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "project13-pub-sub3"
  }
}

#private-subnets

resource "aws_subnet" "project13-private-sub1" {
  vpc_id     = aws_vpc.project13-vpc.id
  cidr_block = var.project13-private-sub1-cidr
  availability_zone = "eu-west-2a"
  tags = {
    Name = "project13-private-sub1"
  }
}

resource "aws_subnet" "project13-private-sub2" {
  vpc_id     = aws_vpc.project13-vpc.id
  cidr_block = var.project13-private-sub2-cidr
  availability_zone = "eu-west-2b"
  tags = {
    Name = "project13-private-sub2"
  }
}

resource "aws_subnet" "project13-private-sub3" {
  vpc_id     = aws_vpc.project13-vpc.id
  cidr_block = var.project13-private-sub3-cidr
  availability_zone = "eu-west-2c"
  tags = {
    Name = "project13-private-sub3"
  }
}

#internet gateway

resource "aws_internet_gateway" "project13-igw" {
  vpc_id = aws_vpc.project13-vpc.id

  tags = {
    Name = "project13-igw"
  }
}

#route

resource "aws_route" "project13-route" {
  route_table_id = aws_route_table.project13-pub-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id     = aws_internet_gateway.project13-igw.id
}


#public rout table

resource "aws_route_table" "project13-pub-rt" {
  vpc_id = aws_vpc.project13-vpc.id

  route = []

  tags = {
    Name = "project13-pub-rt"
  }
}

#private route table

resource "aws_route_table" "project13-private-rt" {
  vpc_id = aws_vpc.project13-vpc.id

  route = []

  tags = {
    Name = "project13-private-rt"
  }
}

#public route table association subnet

resource "aws_route_table_association" "project13-pubrt-asso1" {
  subnet_id      = aws_subnet.project13-pub-sub1.id
  route_table_id = aws_route_table.project13-pub-rt.id
}

resource "aws_route_table_association" "project13-pubrt-asso2" {
  subnet_id      = aws_subnet.project13-pub-sub2.id
  route_table_id = aws_route_table.project13-pub-rt.id
}

resource "aws_route_table_association" "project13-pubrt-asso3" {
  subnet_id      = aws_subnet.project13-pub-sub3.id
  route_table_id = aws_route_table.project13-pub-rt.id
}
#private route table asocciation subnet

resource "aws_route_table_association" "project13-private-rt-asso1" {
  subnet_id      = aws_subnet.project13-private-sub1.id
  route_table_id = aws_route_table.project13-private-rt.id
}

resource "aws_route_table_association" "project13-private-rt-asso2" {
  subnet_id      = aws_subnet.project13-private-sub2.id
  route_table_id = aws_route_table.project13-private-rt.id
}

resource "aws_route_table_association" "project13-private-rt-asso3" {
  subnet_id      = aws_subnet.project13-private-sub3.id
  route_table_id = aws_route_table.project13-private-rt.id
}