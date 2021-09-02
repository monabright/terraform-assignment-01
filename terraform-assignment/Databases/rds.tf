resource "aws_db_instance" "myRDS" {
    name = var.dbname
    identifier = var.identifier
    instance_class = var.instance_class
    engine = var.engine
    engine_version = var.engine-version
    username = var.username
    password = var.password
    port = var.port
    allocated_storage = var.storage
    skip_final_snapshot = var.final_snapshot
     tags = var.tags

}

