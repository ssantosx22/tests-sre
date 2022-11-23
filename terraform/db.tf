provider "aws" {
    region = us-east-1
  }
   
  resource "aws_vpc" "vpc_prd" {
    cidr_block           ="10.0.0.0/16"
    enable_dns_hostnames = true
  }
  
  resource "aws_subnet" "public_subnet_a" {
    vpc_id     = aws_vpc.vpc_prd.id
    cidr_block = "10.0.1.0/24"
    availability_zone  = us-east-1b
  }
  
  resource "aws_subnet" "public_subnet_b" {
    vpc_id     = aws_vpc.vpc_prd.id
    cidr_block = "10.0.2.0/24"
    availability_zone  = us-east-1b
  }
  
  resource "aws_subnet" "public_subnet_a" {
    vpc_id     = aws_vpc.vpc_prd.id
    cidr_block = "10.0.3.0/24"
    availability_zone  = us-east-1b
  }
  
  resource "aws_subnet" "public_subnet_b" {
    vpc_id     = aws_vpc.vpc_prd.id
    cidr_block = "10.0.4.0/24"
    availability_zone  = us-east-1b
  }
  
  resource "aws_instace" "webserver" {
    ami     = ami-08c40ec9ead489470
    instance_type = "t2.micro"
    subnet_id  = aws_subnet.public_subnet_a.id
  }
  
  resource "aws_db_instance" "banco" {
    allocated_storage = 10
    engine = "oracle"
    engine_version = ""
    instance_class = "db.m5.large"
    name = "bancoteste"
    username = "admin"
    password = "T3ste2022Bmg"
    skip_final_snapshot = true
    db_subnet_group_name = aws_db_subnet_group.db_subnet.id
  }
  
  resource "aws_db_subnet_group" "db_subnet" {
    name = "dbsubnet" 
    subnet_ids = [aws_subnet.private_subnet_a.id, aws.subnet.private_subnet_b.id]
  }