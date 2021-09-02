#This will publish the vpc id
output "vpcid" {
    value = aws_vpc.prod-vpc.id
}