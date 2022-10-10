data "aws_key_pair" "remotekey" {
  key_name           = "remote-prod"
}

resource "aws_instance" "tf-instance-1" {
    ami = "ami-08e2d37b6a0129927"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public-subnet.id
    vpc_security_group_ids = [aws_security_group.ec2-SG.id]  
    key_name = "remote-prod"
    availability_zone = "us-west-2a"
}
