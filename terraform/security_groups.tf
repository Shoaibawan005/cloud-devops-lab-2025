resource "aws_security_group" "bastion_sg" {
  name        = "${var.project}-${var.env}-bastion-sg"
  description = "SSH from your IP"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.your_ip_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project}-${var.env}-bastion-sg"
    Project = var.project
    Env     = var.env
  }
}

resource "aws_security_group" "app_sg" {
  name        = "${var.project}-${var.env}-app-sg"
  description = "Allow SSH from bastion only"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  # Optionally open Flask app port (e.g., 5000) from bastion/VPC
  # ingress {
  #   from_port       = 5000
  #   to_port         = 5000
  #   protocol        = "tcp"
  #   security_groups = [aws_security_group.bastion_sg.id]
  # }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project}-${var.env}-app-sg"
    Project = var.project
    Env     = var.env
  }
}