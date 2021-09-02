variable "ami" {
    type = string
    default = "ami-0c2b8ca1dad447f8a"
    description ="This will be used as the ami id for all the linux 2 instances we create"
}

variable "instance_type" {
    type = string 
    default = "t2.micro"
    description = "This determines the instance type that will be used on creation"
}

variable "tag1" {
    type = map 
    description = "This is the name of the instance"
    default = {
        Name = "db"        
    }
}

variable "tag2" {
   description = "This is the name of the instance"
    type = map     
    default = {
        Name = "web"
        
    }
}
variable "tag3" {
    description = "This is the name of the instance"
    type = map 
    default = {
        Name = "ec2"
        
    }
}
