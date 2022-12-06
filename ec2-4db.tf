#db
resource "aws_instance" "tier-ec2-pri-a-db1" {
  ami               = "ami-006e2f9fa7597680a"
  instance_type     = "t2.micro"
  availability_zone = "ap-northeast-2a"

  subnet_id = aws_subnet.db-sub-a.id
  key_name  = "tier-db-key"
  vpc_security_group_ids = [
    aws_security_group.tier-sg-pri-db.id
  ]
  tags = {
    Name = "db1"
  }
}


resource "aws_instance" "tier-ec2-pri-c-db2" {
  ami               = "ami-006e2f9fa7597680a"
  instance_type     = "t2.micro"
  availability_zone = "ap-northeast-2c"

  subnet_id = aws_subnet.db-sub-c.id
  key_name  = "tier-db-key"
  vpc_security_group_ids = [
    aws_security_group.tier-sg-pri-db.id
  ]
  tags = {
    Name = "db2"
  }
}
