variable "vpc_cidr" {
  description = "Specify the cidr block for the vpc"
  type = string
  default = "10.0.0.0/16"
}

variable "hostnames" {
  description = "This will ensure dns hostname is enabled"
  type = bool
  default = true
}

variable "dns_support" {
  description = "This will ensure dns support is enabled"
  type = bool
  default = true
}

variable "classiclink" {
  description = "This will ensure classiclink is not enabled"
  type = bool
  default = false
}
variable "instance_tenancy" {
  description = "this shows what instance tenancy option we will be using"
  type = string
  default = "default"
}

variable "sshport" {
  description = "Allows SSH"
  type = number
  default = 22
}

variable "httpsport" {
  description = "Allows HTTPS"
  type = number
  default = 443
}

variable "httpport" {
  description = "Allows SSH"
  type = number
  default = 80
}

variable "protocols" {
  description = "defines all the protocols listed above"
  type = string
  default = "tcp"
}


variable "egress_port" {
  description = "Allows outbound traffic"
  type = number
  default = 0 #this means it can connect to any port
}

variable "egress_protocol" {
  description = "protocol for outbound traffic"
  type = number
  default = -1 #this is the default number for all protocols.
}

variable "sg_cidr" {
  description = "Defines the cidr block used for all the ports"
  type = list(string) #this simply means multiple cidr blocks can be listed
  default = ["0.0.0.0/0"]
}

variable "prod-subnet-private-1" {
    type = string
    default = "10.0.2.0/24"
    description = "This specifies the cidr block for the private subnet"
}

variable "prod-subnet-public-1" {
    type = string
    default = "10.0.4.0/24"
    description = "This specifies the cidr block for the private subnet"
}

variable "tags" {
    description = "This is the name of the VPC"
    type = map 
    default = {
        Name = "prod-VPC"
        Env = "PROD"
    }
}
variable "pub_az" {
    type = string
    default = "us-east-1b"
    description = "This specifies the availability zone for the public subnet"
}

variable "priv_az" {
    type = string
    default = "us-east-1a"
    description = "this specifies the availability zone for the private subnet"
}

variable "map_public_ip_on_launch" {
  type = bool
  default = "false"
  description = " This lets you decide if you should map ip on launch"
}

variable "map_public_ip_on_launch_pub" {
  type = bool
  default = "true"
  description = " This lets you decide if you should map ip on launch"
}


variable "pub-sub-tags" {
    description = "This is the name of the public subnet"
    type = map 
    default = {
        Name = "prod-subnet-public-1"
        
    }
}

variable "priv-sub-tags" {
    description = "This is the name of the private subnet"
    type = map 
    default = {
        Name = "prod-subnet-private-1"
        
    }
}

variable "public_rt_cidr" {
    description = "This will capture the cudr block for the public rt"
    type = string
    default = "0.0.0.0/0"
}

variable "ipv6_rt_cidr" {
    description = "This reflects the cidr block for ipv6"
    type = string
    default = "::/0"
}

variable "rt_tags" {
    description = "this will show the name for the route table"
    type = map(string)
    default = {
        Name = "Production_RT"
    }
}


