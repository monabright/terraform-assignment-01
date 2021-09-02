#this publishes the instance ide of all three instances
output "instanceid" {
    value = aws_instance.db.*.id
}

output "instanceid2" {
    value = aws_instance.web.*.id
}

output "instanceid3" {
    value = aws_instance.ec2.*.id
}

