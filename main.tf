provider "aws" {
  region = var.region
}

# Creating VPC
resource "aws_vpc" "jenkins_vpc" {
  cidr_block = "10.0.0.0/16"
}


# Creating Internet Gateway
resource "aws_internet_gateway" "jenkins_igw" {
  vpc_id = aws_vpc.jenkins_vpc.id
}

# Creating Subnet
resource "aws_subnet" "jenkins_subnet" {
  vpc_id     = aws_vpc.jenkins_vpc.id
  cidr_block = "10.0.1.0/24"
}

# Creating Security Group
resource "aws_security_group" "jenkins_sg" {
  vpc_id = aws_vpc.jenkins_vpc.id

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

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Creating Route Table
resource "aws_route_table" "jenkins_route_table" {
  vpc_id = aws_vpc.jenkins_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins_igw.id
  }
}

# Associating Subnet with Route Table
resource "aws_route_table_association" "jenkins_route_association" {
  subnet_id      = aws_subnet.jenkins_subnet.id
  route_table_id = aws_route_table.jenkins_route_table.id
}



# Creating EC2 instance
resource "aws_instance" "jenkins_instance" {
  ami                         = var.ami
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.jenkins_subnet.id
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  key_name                    = var.aws_key
  associate_public_ip_address = true
  user_data                   = file("user_data.sh")

  tags = {
    Name = "Jenkins Instance"
  }

}

