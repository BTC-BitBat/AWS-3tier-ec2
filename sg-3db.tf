#DB Security Group
resource "aws_security_group" "tier-sg-pri-db" {
  name = "tier-sg-pri-db"
  vpc_id = aws_vpc.tier.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
      security_groups = [aws_security_group.tier-sg-pub-bastion.id]
  }
  
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "tier-sg-pri-db"
  }
}