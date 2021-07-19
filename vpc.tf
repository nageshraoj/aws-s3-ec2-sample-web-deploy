resource "aws_vpc" "demovpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "Demo VPC"
  }
}

resource "aws_subnet" "demosubnet" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Demo Subnet"
  }
}

resource "aws_route_table" "demoroutetable" {
  vpc_id = aws_vpc.demovpc.id
  tags = {
    "Name" = "Demo Route Table "
  }
}

resource "aws_internet_gateway" "demoigw" {
  vpc_id = aws_vpc.demovpc.id
  tags = {
    "Name" = "Demo IGW"
  }
}

resource "aws_route" "demoroute" {
  route_table_id         = aws_route_table.demoroutetable.id
  gateway_id             = aws_internet_gateway.demoigw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "demorouteassociation" {
  route_table_id = aws_route_table.demoroutetable.id
  subnet_id      = aws_subnet.demosubnet.id
}

