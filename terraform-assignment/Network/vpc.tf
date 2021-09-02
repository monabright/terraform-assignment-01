#Create prod VPC
resource "aws_vpc" "prod-vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = var.hostnames 
    enable_dns_support = var.dns_support
    enable_classiclink = var.classiclink 
    instance_tenancy = var.instance_tenancy
    tags = var.tags
}

#create prod security group
resource "aws_security_group" "prod-secgrp" {
    name = "Allow dev HTTPS"
    vpc_id = aws_vpc.prod-vpc.id
    ingress {
        from_port = var.httpsport
        to_port = var.httpsport
        protocol = var.protocols
        cidr_blocks = var.sg_cidr
    }

   egress  {
      from_port        = var.egress_port
      to_port          = var.egress_port
      protocol         = var.egress_protocol
      cidr_blocks      = var.sg_cidr
      
    }

    ingress {
      from_port      = var.httpport
      to_port        = var.httpport
      protocol       = var.protocols
      cidr_blocks    = var.sg_cidr
    }

   egress  {
      from_port        = var.egress_port
      to_port          = var.egress_port
      protocol         = var.egress_protocol
      cidr_blocks      = var.sg_cidr
      
    }

    ingress {
        from_port       = var.sshport
        to_port         = var.sshport
        protocol        = var.protocols
        cidr_blocks     = var.sg_cidr
    }

  egress  {
      from_port        = var.egress_port
      to_port          = var.egress_port
      protocol         = var.egress_protocol
      cidr_blocks      = var.sg_cidr
      
    }

    depends_on = [aws_vpc.prod-vpc]
}

#Create Internet gateway
resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id

}

#Create Route Table
resource "aws_route_table" "prod-rt" {
  vpc_id = aws_vpc.prod-vpc.id

  route    {
      cidr_block = var.public_rt_cidr
      gateway_id = aws_internet_gateway.prod-igw.id
    }

    route  {
      ipv6_cidr_block        = var.ipv6_rt_cidr
      gateway_id = aws_internet_gateway.prod-igw.id
    }
  

  tags = {
    Name = "${var.rt_tags.Name}"
  }
}

#Create private subnet
resource "aws_subnet" "prod-subnet-private-1" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.prod-subnet-private-1
  availability_zone = var.priv_az
  map_public_ip_on_launch = var.map_public_ip_on_launch
  
   tags = {
    Name = "${var.priv-sub-tags.Name}"
  }
}

#Create public subnet
resource "aws_subnet" "prod-subnet-public-1" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.prod-subnet-public-1
  availability_zone = var.pub_az
  map_public_ip_on_launch = var.map_public_ip_on_launch_pub
  
  tags = {
    Name = "${var.pub-sub-tags.Name}"
  }
}

#Associate the routetables created
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.prod-subnet-public-1.id
  route_table_id = aws_route_table.prod-rt.id
}
