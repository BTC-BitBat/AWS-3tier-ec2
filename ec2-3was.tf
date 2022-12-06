# was 역시 이중화 구성이지만 ebs를 추가적으로 붙여준다.

# was
resource "aws_instance" "tier-ec2-pri-a-was1" {
  ami               = "ami-006e2f9fa7597680a"
  instance_type     = "t2.micro"
  availability_zone = "ap-northeast-2a"

  subnet_id = aws_subnet.was-sub-a.id
  key_name  = "tier-was-key"


  # ebs 추가적으로 구성
  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "8"
  }


  vpc_security_group_ids = [
    aws_security_group.tier-sg-pri-was.id
  ]
  tags = {
    Name = "was1"
  }
}


resource "aws_instance" "tier-ec2-pri-c-was2" {
  ami               = "ami-006e2f9fa7597680a"
  instance_type     = "t2.micro"
  availability_zone = "ap-northeast-2c"

  subnet_id = aws_subnet.was-sub-c.id
  key_name  = "tier-was-key"


  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "8"
  }

  vpc_security_group_ids = [
    aws_security_group.tier-sg-pri-was.id
  ]
  tags = {
    Name = "was2"
  }
}
