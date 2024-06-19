resource "aws_route_table" "public" {
  # required
  vpc_id = aws_vpc.main.id
  # protocol definition of your route table
  route {
    # default route : all ip addrs
    cidr_block = "0.0.0.0/0"
    # to igw not ngw
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private-one" {
  # required
  vpc_id = aws_vpc.main.id
  # protocol definition of your route table
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw1.id
  }
  # a map of tags to assign to the ressources
  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "private-two" {
  # required
  vpc_id = aws_vpc.main.id
  # protocol definition of your route table
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw2.id
  }
  # a map of tags to assign to the ressources
  tags = {
    Name = "private"
  }
}

###############################
## route tables associations ##
###############################
## between route tables and subnets 

resource "aws_route_table_association" "public-one" {
  # required
  subnet_id      = aws_subnet.public_one.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-two" {
  # required
  subnet_id      = aws_subnet.public_two.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private-one" {
  # required
  subnet_id      = aws_subnet.private_one.id
  route_table_id = aws_route_table.private-one.id
}

resource "aws_route_table_association" "private-two" {
  # required
  subnet_id      = aws_subnet.private_two.id
  route_table_id = aws_route_table.private-two.id
}
