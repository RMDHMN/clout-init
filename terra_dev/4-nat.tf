resource "aws_eip" "nat1" {
  # required
  vpc = true
  # optionnal
  tags = {
    Name = "NAT 1"
  }
  # logically required
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "nat2" {
  # required
  vpc = true
  # optionnal
  tags = {
    Name = "NAT 2"
  }
  # logically required
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "ngw1" {
  # required
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public_one.id
  # optionnal
  tags = {
    Name = "NAT 1"
  }
}

resource "aws_nat_gateway" "ngw2" {
  # required
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.public_two.id
  # optionnal
  tags = {
    Name = "NAT 2"
  }
}
