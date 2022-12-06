#Bastion 생성
resource "aws_instance" "tier-ec2-bastion" {
  ami               = "ami-006e2f9fa7597680a"
  instance_type     = "t2.micro"
  availability_zone = "ap-northeast-2a"

  subnet_id = aws_subnet.public-a.id
  key_name  = "tier-bastion-key"
  vpc_security_group_ids = [
    aws_security_group.tier-sg-pub-bastion.id
  ]
  tags = {
    "Name" = "tier-bastion"
  }
}
