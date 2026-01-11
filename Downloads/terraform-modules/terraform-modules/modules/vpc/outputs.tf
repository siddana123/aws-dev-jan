output "vpc_id" {
  value = aws_vpc.xb-main-stage-vpc.id
}

output "subnet_id1" {
  value = aws_subnet.pub_sub1
}
output "subnet_id2" {
  value = aws_subnet.pub_sub2
}
output "subnet_id3" {
  value = aws_subnet.pub_sub3
}



