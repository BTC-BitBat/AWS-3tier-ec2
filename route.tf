#public -> igw
resource "aws_route_table" "tier-rt-pub" {
  vpc_id = aws_vpc.tier.id

  tags = {
    "Name" = "tier-rt-pub"
  }
}
resource "aws_route" "tier-r-pub-igw" {
  route_table_id         = aws_route_table.tier-rt-pub.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.tier-igw.id
}


#Public subnet을 public route table에 연결
resource "aws_route_table_association" "tier-rtass-pub-a" {
  subnet_id      = aws_subnet.public-a.id
  route_table_id = aws_route_table.tier-rt-pub.id
}
resource "aws_route_table_association" "tier-rtass-pub-c" {
  subnet_id      = aws_subnet.public-c.id
  route_table_id = aws_route_table.tier-rt-pub.id

}

#private web -> nat
resource "aws_route_table" "tier-rt-pri-web" {
  vpc_id = aws_vpc.tier.id

  tags = {
    Name = "tier-rt-pri-web"
  }
}
resource "aws_route" "tier-r-pri-web" {
  route_table_id         = aws_route_table.tier-rt-pri-web.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.tier-nat.id

  depends_on = [
    aws_nat_gateway.tier-nat
  ]
}

#private web -> private route table association
resource "aws_route_table_association" "tier-rtass-pri-a-web" {
  subnet_id      = aws_subnet.web-sub-a.id
  route_table_id = aws_route_table.tier-rt-pri-web.id

  depends_on = [
    aws_route.tier-r-pri-web
  ]

}
resource "aws_route_table_association" "tier-rtass-pri-c-web" {
  subnet_id      = aws_subnet.web-sub-c.id
  route_table_id = aws_route_table.tier-rt-pri-web.id

  depends_on = [
    aws_route.tier-r-pri-web
  ]
}
