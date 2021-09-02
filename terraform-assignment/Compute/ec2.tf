#create a db instance
resource "aws_instance" "db" {
    ami = var.ami
    instance_type = var.instance_type

    tags = var.tag1
}

#create a web instance
resource "aws_instance" "web" {
    ami = var.ami
    instance_type = var.instance_type

    depends_on = [aws_instance.db]

    tags = var.tag2
}

#create an ec2 instance
resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type

    tags = var.tag3
}

#Assign elastic eips to all servers
resource "aws_eip" "elasticeip1" {
    instance = aws_instance.ec2.id
}

resource "aws_eip" "elasticeip2" {
    instance = aws_instance.web.id
}

resource "aws_eip" "elasticeip3" {
    instance = aws_instance.db.id
}



