resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name    = "${var.project}-${var.env}-nat-eip"
    Project = var.project
    Env     = var.env
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name    = "${var.project}-${var.env}-nat"
    Project = var.project
    Env     = var.env
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route" "private_to_internet_via_nat" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}