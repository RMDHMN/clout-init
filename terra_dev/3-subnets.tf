resource "aws_subnet" "public_one" {
  # required
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.0.0/18"
  availability_zone = "eu-west-3a"
  # required for EKS
  map_public_ip_on_launch = true
  # optionnal
  tags = {
    Name                           = "public-eu-west-3a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"       = 1
  }
}

resource "aws_subnet" "public_two" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.64.0/18"
  availability_zone       = "eu-west-3b"
  map_public_ip_on_launch = true

  tags = {
    Name                           = "public-eu-west-3b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"       = 1
  }
}

resource "aws_subnet" "private_one" {
  # required
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.128.0/18"
  availability_zone = "eu-west-3a"
  # optionnal
  tags = {
    Name                              = "private-eu-west-3a"
    "kubernetes.io/cluster/eks"    = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private_two" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.192.0/18"
  availability_zone = "eu-west-3b"

  tags = {
    Name                              = "private-eu-west-3b"
    "kubernetes.io/cluster/eks"    = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}
