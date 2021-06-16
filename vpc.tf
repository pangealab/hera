#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "elk" {
  cidr_block = "14.0.0.0/16"
  tags = map(
    "Name", "ELK VPC",
  )
}

resource "aws_subnet" "elk" {
  count = 1
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = "14.0.${count.index}.0/24"
  vpc_id            = aws_vpc.elk.id
  map_public_ip_on_launch = "true"
  tags = map(
    "Name", "ELK Subnet",
  )
}

resource "aws_internet_gateway" "elk" {
  vpc_id = aws_vpc.elk.id
  tags = {
    Name = "ELK IGW"
  }
}

resource "aws_route_table" "elk" {
  vpc_id = aws_vpc.elk.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.elk.id
  }
}

resource "aws_route_table_association" "elk" {
  count = 1
  subnet_id      = aws_subnet.elk.*.id[count.index]
  route_table_id = aws_route_table.elk.id
}
