resource "aws_instance" "demoec2" {
  ami                    = data.aws_ami.ec2ami.id
  instance_type          = var.ec2type
  subnet_id              = aws_subnet.demosubnet.id
  vpc_security_group_ids = [aws_security_group.demosg.id]
  key_name = var.pubkey_name
  user_data = <<EOF
        #!/bin/bash
        sudo yum update -y 
        sudo yum install httpd -y
        sudo systemctl start httpd
        sudo systemctl enable httpd
  EOF

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("${var.pubkey_name}.pem")
  }

  provisioner "file" {
    source      = "${var.website_location}/"
    destination = "/home/ec2-user"
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 30",
       "sudo cp -R /home/ec2-user/. /var/www/html "
    ]
    on_failure = continue
  }

  tags = {
    "Name" = "Demo EC2"
  }
}