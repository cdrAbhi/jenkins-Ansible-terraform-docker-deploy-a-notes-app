provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240801"]
  }
  
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "my_sg" {
  name = "my_sg"
  
  dynamic "ingress" {
    for_each = [22, 8080, 8000]
    iterator = port
    
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "key_tf" {
  key_name   = "my_key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "inst_1" {
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key_tf.key_name
  ami                    = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  
  tags = {
    Name = "web-server"
  }
}

resource "aws_instance" "inst_2" {
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key_tf.key_name
  ami                    = data.aws_ami.ubuntu.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  
  tags = {
    Name = "jenkins-server"
  }
}

output "web_server_public_ip" {
  value = aws_instance.inst_1.public_ip
}

output "jenkins_server_public_ip" {
  value = aws_instance.inst_2.public_ip
}
