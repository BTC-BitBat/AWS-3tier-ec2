#Was Sicurity Group
resource "aws_security_group" "tier-sg-pri-was" {
  name = "tier-sg-pri-was"
  vpc_id = aws_vpc.tier.id

  ingress {
    from_port = 22
    to_port = 8080
    protocol = "tcp"
    security_groups = [aws_security_group.tier-sg-pub-bastion.id]
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["10.0.10.0/24","10.0.20.0/24"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "tier-sg-pri-was"
  }
}