#Internet GateWay 생성
resource "aws_internet_gateway" "tier-igw" {
  vpc_id = aws_vpc.tier.id
  tags = {
    "Name" = "tier-igw"
  }
}

#eip 생성
resource "aws_eip" "tier-eip" {
  vpc = true
  tags = {
    "Name" = "tier-eip"
  }
}

#Nat Gateway 생성
resource "aws_nat_gateway" "tier-nat" {
  allocation_id = aws_eip.tier-eip.id
  subnet_id     = aws_subnet.public-a.id
  tags = {
    "Name" = "tier-nat"
  }
}
