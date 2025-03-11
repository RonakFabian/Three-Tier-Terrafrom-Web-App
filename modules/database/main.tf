resource "aws_db_instance" "primary" {
  identifier           = "main-db"
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "securepassword"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  multi_az             = false
  publicly_accessible  = false
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
}

resource "aws_db_instance" "read_replica" {
  identifier           = "read-replica-db"
  replicate_source_db  = aws_db_instance.primary.identifier
  instance_class       = "db.t3.micro"
  publicly_accessible  = false
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.rds_subnet_1.id, aws_subnet.rds_subnet_2.id]
  tags = {
    Name = "rds-subnet-group"
  }
}
