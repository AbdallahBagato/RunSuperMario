
resource "aws_instance" "Server1" {
  ami = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.Public_SubnetA.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  key_name = "bagato"
  root_block_device {
    volume_size = 8          # Set to 8 GiB
    volume_type = "gp2"      # General Purpose SSD (default)
    delete_on_termination = true
  }
  provisioner "local-exec" {
    command = <<EOT
    echo ${self.public_ip} > /home/abdallah/inventory/inv.txt 
    EOT
  }
  tags = {
    Name = "Web1"
  }
}

resource "aws_instance" "Server2" {
  ami = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.Public_SubnetB.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  key_name = "bagato"
  root_block_device {
    volume_size = 8          # Set to 8 GiB
    volume_type = "gp2"      # General Purpose SSD (default)
    delete_on_termination = true
  }
  provisioner "local-exec" {
    command = <<EOT
    echo ${self.public_ip} >> /home/abdallah/inventory/inv.txt
    echo [Servers] >> /home/abdallah/inventory/inv.txt
    EOT
  }
  
  tags = {
    Name = "Web2"
  }
}

