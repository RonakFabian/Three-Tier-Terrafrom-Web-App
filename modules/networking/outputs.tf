output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1
}
output "public_subnet_2_id" {
  value = aws_subnet.private_subnet_2
}
output "private_subnet_1_id" {
  value = aws_subnet.private_subnet_1
}
output "private_subnet_2_id" {
  value = aws_subnet.private_subnet_2
}

output "private_subnet_rds_1_id" {
  value = aws_subnet.rds_subnet_1
}
output "private_subnet_rds_2_id" {
  value = aws_subnet.rds_subnet_2
}


