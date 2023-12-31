# vpc.tf

# Create VPC
resource "aws_vpc" "main-vpc" {
  cidr_block              = var.vpc_cidr
  enable_dns_support      = var.enable_dns_support
  enable_dns_hostnames    = var.enable_dns_hostnames

  tags = {
    Name                  = var.vpc_name
  }
}


# Create IGW
resource "aws_internet_gateway" "vpc-igw" {
  tags = {
    Name                  = var.igw_name
  }
}

# Attach IGW to VPC
resource "aws_internet_gateway_attachment" "igw-attach" {
  internet_gateway_id     = aws_internet_gateway.vpc-igw.id
  vpc_id                  = aws_vpc.main-vpc.id
}


# Create Public Subnet 1
resource "aws_subnet" "pub-sub1" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = var.pub-sub1_cidr
  map_public_ip_on_launch = var.pub-sub_map_public_ip
  availability_zone       = var.pub-sub1_az

  tags = {
    Name                  = var.pub-sub1_name
  }
}

# Create Public Subnet 2
resource "aws_subnet" "pub-sub2" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = var.pub-sub2_cidr
  map_public_ip_on_launch = var.pub-sub_map_public_ip
  availability_zone       = var.pub-sub2_az

  tags = {
    Name = var.pub-sub2_name   
  }
}

# Create Public Subnet 3
resource "aws_subnet" "pub-sub3" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = var.pub-sub3_cidr
  map_public_ip_on_launch = var.pub-sub_map_public_ip
  availability_zone       = var.pub-sub3_az

  tags = {
    Name                  = var.pub-sub3_name
  }
}

# Create Private Subnet 1
resource "aws_subnet" "pri-sub1" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = var.pri-sub1_cidr
  availability_zone       = var.pri-sub1_az

  tags = {
    Name                   = var.pri-sub1_name
  }
}

# Create Private Subnet 2
resource "aws_subnet" "pri-sub2" {
  vpc_id                    = aws_vpc.main-vpc.id
  cidr_block                = var.pri-sub2_cidr
  availability_zone         = var.pri-sub2_az

  tags = {
    Name                    = var.pri-sub2_name
  }
}

# Create Private Subnet 3
resource "aws_subnet" "pri-sub3" {
  vpc_id                    = aws_vpc.main-vpc.id
  cidr_block                = var.pri-sub3_cidr
  availability_zone         = var.pri-sub3_az

  tags = {
    Name                    = var.pri-sub3_name
  }
}


# Create VPC Public Route Table
resource "aws_route_table" "pub-rt" {
  vpc_id                    = aws_vpc.main-vpc.id
  route {
    cidr_block              = var.pub-rt_cidr
    gateway_id              = aws_internet_gateway.vpc-igw.id
  }

  tags = {
    Name                    = var.pub-rt_name
  }
}


# Associate Public Subnet 1 with the Public Route Table
resource "aws_route_table_association" "pub-sub1_rt_assoc" {
  subnet_id                 = aws_subnet.pub-sub1.id
  route_table_id            = aws_route_table.pub-rt.id
  }
# Associate Public Subnet 2 with the Public Route Table
resource "aws_route_table_association" "pub-sub2_rt_assoc" {
  subnet_id                 = aws_subnet.pub-sub2.id
  route_table_id            = aws_route_table.pub-rt.id
  }

# Associate Public Subnet 3 with the Public Route Table
resource "aws_route_table_association" "pub-sub3_rt_assoc" {
  subnet_id                 = aws_subnet.pub-sub3.id
  route_table_id            = aws_route_table.pub-rt.id
  }


# Create VPC Private Route Table
resource "aws_route_table" "pri-rt" { 
  vpc_id                    = aws_vpc.main-vpc.id
  # No default 0.0.0.0/0 route initially. This will be added later once a NAT Gateway or NAT instance is available.
  tags = {
    Name                    = var.pri-rt_name
  }
}

# Associate Private Subnet 1 with the Private Route Table
resource "aws_route_table_association" "pri-sub1_rt_assoc" {
  subnet_id                 = aws_subnet.pri-sub1.id
  route_table_id            = aws_route_table.pri-rt.id
}

# Associate Private Subnet 2 with the Private Route Table
resource "aws_route_table_association" "pri-sub2_rt_assoc" {
  subnet_id                 = aws_subnet.pri-sub2.id
  route_table_id            = aws_route_table.pri-rt.id
}

# Associate Private Subnet 3 with the Private Route Table
resource "aws_route_table_association" "pri-sub3_rt_assoc" {
  subnet_id                 = aws_subnet.pri-sub3.id
  route_table_id            = aws_route_table.pri-rt.id
}