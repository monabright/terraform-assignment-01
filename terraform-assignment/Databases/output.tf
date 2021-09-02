#this will show the port for mariadb
output "port" {
  value = aws_db_instance.myRDS.port
}
#publish the resource id of mariadb
output "resource_id" {
  value = aws_db_instance.myRDS.resource_id
}