# data "aws_vpc" "main" {
#   id = "myID"
# }

resource "aws_internet_gateway" "igw" {
  # required
  # vpc_id = data.aws_vpc.main.id
  vpc_id = aws_vpc.main.id
  # optionnal
  tags = {
    Name = "igw"
  }
}
