resource "aws_default_vpc" "_" {
  tags = {
    Name        = "default-vpc"
    ManagedBy   = "Terraform"
    Environment = local.variables.environment
  }
}

resource "aws_default_security_group" "_" {
  vpc_id = aws_default_vpc._.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "default-sg"
    ManagedBy   = "Terraform"
    Environment = local.variables.environment
  }
}

resource "aws_key_pair" "haproxy" {
  key_name      = local.variables.key_name
  public_key    = file("/mnt/c/Users/lpmatos/Desktop/packer-terraform/keys/haproxy.pub")
}

resource "aws_eip" "default" {
  vpc           = true
  instance      = aws_instance.haproxy.id
  tags = {
    Name        = format("elastic-ip-%s", local.variables.project_name)
    ManagedBy   = "Terraform"
    Environment = local.variables.environment
  }
}

resource "aws_instance" "haproxy" {
  ami                     = data.aws_ami.haproxy.id
  instance_type           = "t2.micro"
  key_name                = aws_key_pair.haproxy.key_name

  vpc_security_group_ids  = [ aws_default_security_group._.id ]

  tags = {
    Name        = local.variables.project_name
    ManagedBy   = "Terraform"
    Environment = local.variables.environment
  }

  provisioner "remote-exec" {
    connection {
      host          = self.public_ip
      type          = "ssh"
      user          = "ubuntu"
      private_key   = file("/mnt/c/Users/lpmatos/Desktop/packer-terraform/keys/haproxy")
      timeout       = "1m"
      agent         = false
    }
  }
}
