#Create a VPC with 2 public subnets
# and 4 private subnets with an Internet Gateway (IGW)
module "networking" {
  source      = "../modules/networking"
  cidr        = var.cidr
  igw_name    = var.igw_name
  vpc_name    = var.vpc_name
  cidr_block1 = var.cidr_block1
  cidr_block2 = var.cidr_block2
  cidr_block3 = var.cidr_block3
  cidr_block4 = var.cidr_block4
  cidr_block5 = var.cidr_block5
  cidr_block6 = var.cidr_block6

}

#Create an Auto Scaling Group (ASG) with two EC2 instances in the public subnets,
# an Application Load Balancer (ALB) to distribute traffic,
# and a CloudFront distribution for global content delivery. 
module "client" {
  source      = "../modules/client"
  subnet_id_1 = module.networking.public_subnet_1_id
  subnet_id_2 = module.networking.public_subnet_2_id

}

#Create an Auto Scaling Group (ASG) with two EC2 instances in the private subnets,
# an Application Load Balancer (ALB) to distribute traffic.
module "server" {
  source = "../modules/server"

}

#Create an RDS primary instance in one private subnet and a read replica in another
module "database" {
  source = "../modules/database"
}

