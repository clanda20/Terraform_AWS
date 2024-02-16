terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}


variable "vpc_id" {}

resource "aws_security_group" "drines_ucsc_test" {
  name = "drines_test_ec2_access"
  vpc_id = var.vpc_id
  
  tags = {
    Name = "SEQAX409"
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["99.104.37.103/32"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "debian-11" {
  most_recent = true

  filter {
    name = "name"
    values = ["debian-12-amd64-*"]
  }

  owners = ["136693071363"]
}


resource "aws_instance" "app_server" {
  ami           = data.aws_ami.debian-11.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.drines_ucsc_test.id]
  key_name = "testing_aws_key"

  count = 4

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

output "hostid" {
  value = aws_instance.app_server.*.public_dns
}