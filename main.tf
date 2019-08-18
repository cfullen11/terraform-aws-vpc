resource "aws_vpc" "skodabeer" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name            = "skodabeer"
    Environement    = "test"
    Owner           = "dogspam@me.com"
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.skodabeer.id
  cidr_block = "172.2.0.0/28"
  timeouts {
    create = "7m"
    delete = "7m"
  }
}

resource "aws_subnet" "public_subnet-1" {
  vpc_id = aws_vpc.skodabeer.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "skodabeer"
    Environement = "test"
    Owner = "dogspam@me.com"
    SubnetUse = "public"
  }
}


