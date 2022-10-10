resource "aws_vpc" "vpc" {
    cidr_block = "10.10.0.0/16"
    tags = {
      Name = "jenkinsvpc"
    }
}

resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.10.1.0/24"
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = true
    tags = {
        "Name" = "public-sub"
    }
    depends_on = [
      aws_vpc.vpc
    ]   
}

resource "aws_subnet" "private-subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.10.2.0/24"
    tags = {
        "Name" = "private-sub"
    }
    depends_on = [
      aws_vpc.vpc,
      aws_subnet.public-subnet
    ]   
}

resource "aws_internet_gateway" "igw-ec2" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "igw-ec2"
  }
}

resource "aws_route_table" "ec2-route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-ec2.id
  }

  
  tags = {
    Name = "ec2-route"
  }
}

resource "aws_route_table_association" "public-sub" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.ec2-route.id
}
