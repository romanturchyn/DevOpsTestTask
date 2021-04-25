provider "aws" {
  access_key = "BlaBlaBlaSomeAWSAccessKey" 
  secret_key = "BlablalbaSomeWASSecretkey"
  region     = "eu-central-1"
}

resource "aws_instance" "my_site" {
  count                  = 1
  ami                    = "ami-0db9040eb3ab74509"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_site.id]
  user_data              = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
myip='curl http://169.254.169.254/latest/meta-data/local-ipv4'
echo "<h2>webserver with ip: $myip<h2><br>build by terraform!" > var/www/index.html
sudo service http start
chkconfig httpd on
EOF

  tags = {
    Name  = "my site"
    Owner = "Roman Turchyn"
    OS    = "Amazon linux"
  }
}

resource "aws_security_group" "my_site" {
  name        = "my_site security group"
  description = "Allow TLS inbound traffic"


  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-site security group"
  }
}
