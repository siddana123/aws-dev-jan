# Create VPC
resource "aws_vpc" "xb-main-stage-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.tenancy
    tags = {
    "Name"            = "${var.vpc_name}"
    "Environment"     = "${var.environment}"
    "JiraId"          = "${var.jira_id}"
    "ApprovedBy"      = "${var.approved_by}"
    "ProjectOwner"    = "${var.project_owner}"
    "CreatedBy"       = "${var.created_by}"
  }
  }

# Create Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    "Name"            = "${var.igw_name}"
    "Environment"     = "${var.environment}"
    "JiraId"          = "${var.jira_id}"
    "ApprovedBy"      = "${var.approved_by}"
    "ProjectOwner"    = "${var.project_owner}"
    "CreatedBy"       = "${var.created_by}"
  }
  }

# Create Public Subnet1
resource "aws_subnet" "pub_sub1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.pub_sub1_cidr_block
  availability_zone       = var.availability_zone_sub1 #"ap-south-1a"
  map_public_ip_on_launch = var.map_public_ip_on_launch_pub_sub #true
  tags = {
    "Name"            = "${var.pub_sub1_name}"
    "Environment"     = "${var.environment}"
    "JiraId"          = "${var.jira_id}"
    "ApprovedBy"      = "${var.approved_by}"
    "ProjectOwner"    = "${var.project_owner}"
    "CreatedBy"       = "${var.created_by}"
  }
}

# Create Public Subnet2

resource "aws_subnet" "pub_sub2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.pub_sub2_cidr_block
  availability_zone       = var.availability_zone_sub2 #"ap-south-1b"
  map_public_ip_on_launch = var.map_public_ip_on_launch_pub_sub #true
  tags = {
    "Name"            = "${var.pub_sub2_name}"
    "Environment"     = "${var.environment}"
    "JiraId"          = "${var.jira_id}"
    "ApprovedBy"      = "${var.approved_by}"
    "ProjectOwner"    = "${var.project_owner}"
    "CreatedBy"       = "${var.created_by}"
  }
  }


# Create Public Subnet3
resource "aws_subnet" "pub_sub3" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.pub_sub3_cidr_block
  availability_zone       = var.availability_zone_sub3 #"ap-south-1c"
  map_public_ip_on_launch = var.map_public_ip_on_launch_pub_sub #true
  tags = {
    "Name"            = "${var.pub_sub3_name}"
    "Environment"     = "${var.environment}"
    "JiraId"          = "${var.jira_id}"
    "ApprovedBy"      = "${var.approved_by}"
    "ProjectOwner"    = "${var.project_owner}"
    "CreatedBy"       = "${var.created_by}"
  }
  }


# Create Private Subnet1
resource "aws_subnet" "prv_sub1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.prv_sub1_cidr_block
  availability_zone       = var.availability_zone_sub1 #"ap-south-1a"
  map_public_ip_on_launch = var.map_public_ip_on_launch_pvt_sub #false

  tags = {
    "Name"            = "${var.pvt_sub1_name}"
    "Environment"     = "${var.environment}"
    "JiraId"          = "${var.jira_id}"
    "ApprovedBy"      = "${var.approved_by}"
    "ProjectOwner"    = "${var.project_owner}"
    "CreatedBy"       = "${var.created_by}"
  }
  }


# Create Private Subnet2
resource "aws_subnet" "prv_sub2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.prv_sub2_cidr_block
  availability_zone       = var.availability_zone_sub2 #"ap-south-1b"
  map_public_ip_on_launch = var.map_public_ip_on_launch_pvt_sub #false
  tags = {
    "Name"            = "${var.pvt_sub2_name}"
    "Environment"     = "${var.environment}"
    "JiraId"          = "${var.jira_id}"
    "ApprovedBy"      = "${var.approved_by}"
    "ProjectOwner"    = "${var.project_owner}"
    "CreatedBy"       = "${var.created_by}"
  }
  }


# Create Private Subnet3
resource "aws_subnet" "prv_sub3" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.prv_sub3_cidr_block
  availability_zone       = var.availability_zone_sub3 #"ap-south-1c"
  map_public_ip_on_launch = var.map_public_ip_on_launch_pvt_sub #false
  tags = {
    "Name"            = "${var.pvt_sub3_name}"
    "Environment"     = "${var.environment}"
    "JiraId"          = "${var.jira_id}"
    "ApprovedBy"      = "${var.approved_by}"
    "ProjectOwner"    = "${var.project_owner}"
    "CreatedBy"       = "${var.created_by}"
  }
  }





# Create Public Route Table
resource "aws_route_table" "pub_sub1_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.rt_cidr_block #"0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name"            = "${var.pub_sub_rt_name}"
    "Environment"     = "${var.environment}"
    "JiraId"          = "${var.jira_id}"
    "ApprovedBy"      = "${var.approved_by}"
    "ProjectOwner"    = "${var.project_owner}"
    "CreatedBy"       = "${var.created_by}"
  }
  }


# Create route table association of public subnet1

resource "aws_route_table_association" "internet_for_pub_sub1" {
  route_table_id = aws_route_table.pub_sub1_rt.id
  subnet_id      = aws_subnet.pub_sub1.id
}
# Create route table association of public subnet2

resource "aws_route_table_association" "internet_for_pub_sub2" {
  route_table_id = aws_route_table.pub_sub1_rt.id
  subnet_id      = aws_subnet.pub_sub2.id
}

# Create route table association of public subnet3

resource "aws_route_table_association" "internet_for_pub_sub3" {
  route_table_id = aws_route_table.pub_sub1_rt.id
  subnet_id      = aws_subnet.pub_sub3.id
}

# Create EIP for NAT GW1
resource "aws_eip" "eip_natgw1" {
  count = 1 #"1"
}

# Create NAT gateway1

resource "aws_nat_gateway" "natgateway_1" {
  count         = 1 #"1"
  allocation_id = aws_eip.eip_natgw1[count.index].id
  subnet_id     = aws_subnet.pub_sub1.id
  tags = {
    Name= "My-NAT-GATEWAY"
  }
}


# Create private route table for prv sub1

resource "aws_route_table" "prv_sub1_rt" {
  count  = 1 #"1"
  vpc_id = var.vpc_id
  route {
    cidr_block     = var.rt_cidr_block #"0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgateway_1[count.index].id
  }
  tags = {
    "Name"            = "${var.pvt_sub_rt_name}"
    "Environment"     = "${var.environment}"
    "JiraId"          = "${var.jira_id}"
    "ApprovedBy"      = "${var.approved_by}"
    "ProjectOwner"    = "${var.project_owner}"
    "CreatedBy"       = "${var.created_by}"
  }
}

# Create route table association betn prv sub1 & NAT GW1

resource "aws_route_table_association" "pri_sub1_to_natgw1" {
  count          = 1 #"1"
  route_table_id = aws_route_table.prv_sub1_rt[count.index].id
  subnet_id      = aws_subnet.prv_sub1.id
}

# Create private route table for prv sub2

resource "aws_route_table_association" "pri_sub2_to_natgw1" {
  count          = 1 #"1"
  route_table_id = aws_route_table.prv_sub1_rt[count.index].id
  subnet_id      = aws_subnet.prv_sub2.id
}

# Create private route table for prv sub3

resource "aws_route_table_association" "pri_sub3_to_natgw1" {
  count          = 1 #"1"
  route_table_id = aws_route_table.prv_sub1_rt[count.index].id
  subnet_id      = aws_subnet.prv_sub3.id
}