provider "aws" {
    region = "us-east-1"
    access_key = "AKIAREMTK3TBZHHPYEFK"
    secret_key = "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"
  
}

resource "aws_vpc" "mynewvpc" {

    cidr_block = "25.0.0.0/16"

    tags = {
    Name = "mynewvpc"
  }
  
}

resource "aws_subnet" "mynewsubnet" {
    vpc_id = aws_vpc.mynewvpc.id
    cidr_block = "25.0.10.0/28"
    availability_zone = "us-east-1a"

     tags = {
    Name = "mynewsubnet"
  }
  
}

data "aws_vpc" "existing" {
  default = true
}

resource "aws_subnet" "for-existing-vpc" {
  vpc_id            = data.aws_vpc.existing.id
  availability_zone = "us-east-1a"
  cidr_block        = "172.31.96.0/20"

      tags = {
    Name = "for-existing-vpc"
  }
}