data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "public" {
  count         = (var.public_instance_count > 0) ? var.public_instance_count : 0
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.public_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "public-instance-${count.index + 1}"
  }

  provisioner "file" {
    source      = "~/.ssh/id_ed25519"
    destination = "/home/ec2-user/.ssh/id_ed25519"

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("~/.ssh/id_ed25519")
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 600 /home/ec2-user/.ssh/id_ed25519",
      "sudo yum install -y git",
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("~/.ssh/id_ed25519")
    }
  }
}

resource "aws_instance" "private" {
  count         = (var.private_instance_count > 0) ? var.private_instance_count : 0
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id]

  tags = {
    Name = "private-instance-${count.index + 1}"
  }
}