output "vpc" {
  value = aws_vpc.skodabeer
}

output "public_subnet" {
  value = aws_subnet.public_subnet-1
}

output "craig_security_group" {
  value = aws_security_group.allow_craig
}
