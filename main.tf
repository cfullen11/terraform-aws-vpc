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
    Name = "public_subnet_1"
    Environement = "test"
    Owner = "dogspam@me.com"
    SubnetUse = "public"
  }
}

resource "aws_security_group" "allow_craig" {
  name        = "allow_craig"
  description = "Allow Craig Home IP"
  vpc_id      = aws_vpc.skodabeer.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["104.185.72.107/32"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


