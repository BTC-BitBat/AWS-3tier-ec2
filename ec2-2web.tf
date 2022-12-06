#Web,DB 이중화 구성
# Availability Zona A 에 ec2생성
resource "aws_instance" "tier-ec2-pri-a-web1" {
  ami               = "ami-006e2f9fa7597680a"
  instance_type     = "t2.micro"
  availability_zone = "ap-northeast-2a"

  subnet_id = aws_subnet.web-sub-a.id
  key_name  = "tier-web-key"
  vpc_security_group_ids = [
    aws_security_group.tier-sg-pri-web.id
  ]
  tags = {
    "Name" = "web1"
  }
}
#Availability Zona C 에 ec2 생성
resource "aws_instance" "tier-ec2-pri-web2" {
  ami               = "ami-006e2f9fa7597680a"
  instance_type     = "t2.micro"
  availability_zone = "ap-northeast-2c"

  subnet_id = aws_subnet.web-sub-c.id
  key_name  = "tier-web-key"
  vpc_security_group_ids = [
    aws_security_group.tier-sg-pri-web.id
  ]
  tags = {
    "Name" = "web2"
  }
}
