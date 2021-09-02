variable "identifier" {
    type = string 
    default = "my-fisrt-rds"
    description = "This is the name of the aurora cluster"
}

variable "instance_class" {
  type = string
  default = "db.t2.micro"
  description = "This explains the instance class tat will be used for this instance"
}

variable "engine" {
    type = string 
    default = "mariadb"
    description = "This describes the engine we will use for the RDS"
}

variable "engine-version" {
    type = string 
    default = "10.2.21"
    description = "This is the engine version mariadb will be running on"
}

variable "dbname" {
    type = string
    default = "myDB"
    description = "This is the DB name"
}

variable "username" {
    type = string
    default = "bob"
    description = "This is username for the DB"
}

variable "password" {
    type = string
    default = "password123"
    description = "This is the password for the DB"
}

variable "final_snapshot" {
    type = bool 
    default = true
    description = "This is the final snapshot for the DB"
}

variable "tags" {
    type = map 
    default = {
        Name = "myDB"
        
    }
}

variable "storage" {
    type = number
    default = 20
    description = "This is the amount of storgae reserved for the cluster"
}

variable "port" {
    type = number
    default = 3306
    description = "This is the port used to connect to mariadb"
}