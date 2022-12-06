#Web Security Group
resource "aws_security_group" "tier-sg-pri-web" {
  name = "tier-sg-pri-web"
  vpc_id = aws_vpc.tier.id
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [aws_security_group.tier-sg-pub-bastion.id]
  }
  ingress {
    from_port = 80
    to_port = 80
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
    "Name" = "tier-sg-pri-web"
  }
}