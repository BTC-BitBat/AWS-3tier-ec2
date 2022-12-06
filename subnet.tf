#=============================================public=========================================#

#Public Subnet a 생성 (Nat,Bastion)
resource "aws_subnet" "public-a" {
  vpc_id            = aws_vpc.tier.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "tier-public-a"
  }

}

#Public Subnet b 생성 
resource "aws_subnet" "public-c" {
  vpc_id            = aws_vpc.tier.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "tier-public-c"
  }

}

#===================================================web======================================#

#Web Subnet a 생성 (Web-a)
resource "aws_subnet" "web-sub-a" {
  vpc_id            = aws_vpc.tier.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    "Name" = "tier-web-sub-a"
  }

}
#Web Subnet b 생성 (Web-c)
resource "aws_subnet" "web-sub-c" {
  vpc_id            = aws_vpc.tier.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    "Name" = "tier-web-sub-c"
  }

}

#=============================================was=========================================#

#Was Subnet a 생성 (Was)
resource "aws_subnet" "was-sub-a" {
  vpc_id            = aws_vpc.tier.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    "Name" = "tier-was-sub-a"
  }
}

#Was Subnet b 생성 (Was)
resource "aws_subnet" "was-sub-c" {
  vpc_id            = aws_vpc.tier.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    "Name" = "tier-was-sub-c"
  }
}
#=========================================DB==============================================#

#DB Subnet a 생성 (DB)
resource "aws_subnet" "db-sub-a" {
  vpc_id            = aws_vpc.tier.id
  cidr_block        = "10.0.7.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    "Name" = "tier-db-sub-a"
  }
}

#DB Subnet b 생성 (DB)
resource "aws_subnet" "db-sub-c" {
  vpc_id            = aws_vpc.tier.id
  cidr_block        = "10.0.8.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    "Name" = "tier-db-sub-c"
  }
}
