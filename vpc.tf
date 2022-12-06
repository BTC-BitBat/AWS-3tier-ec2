resource "aws_vpc" "tier" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "tier-vpc"
  }

}
