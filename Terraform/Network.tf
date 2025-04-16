resource "aws_vpc" "Proj" {
  cidr_block = "10.10.0.0/16"
  tags = {
     Name = "Proj"
  }
}

resource "aws_subnet" "Public_SubnetA" {
  vpc_id     = aws_vpc.Proj.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Public_Subnet_A"
  }
}

resource "aws_subnet" "Public_SubnetB" {
  vpc_id     = aws_vpc.Proj.id
  cidr_block = "10.10.2.0/24"
  availability_zone= "us-east-1b"
  tags = {
    Name = "Public_Subnet_B"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.Proj.id

  tags = {
    Name = "Proj_GW"
  }
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.Proj.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "InternetRouteTable"
  }
}

resource "aws_route_table_association" "Sub0" {
  subnet_id = aws_subnet.Public_SubnetA.id
  route_table_id = aws_route_table.RT.id
}
resource "aws_route_table_association" "Sub1" {
  subnet_id = aws_subnet.Public_SubnetB.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.Proj.id
  ingress {
    description = "Allow SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  ##Allow the SSH
  }
    ingress {
    description = "Allow HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   ## Allow the http
  }
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
}
tags = {
  Name = "Allow SSH & Http & All outgoing"
}
}
