# output "ec2_instance_private_ips" {
#   description = "Private IP addresses of the EC2 instances"
#   value       = module.ec2_instances.*.private_ip
# }
#
# output "ec2_instance_public_ip" {
#   description = "Public IP address of the EC2 instance"
#   value = module.ec2_instances.*.public_ip
# }
# output "instance_public_dns" {
#   description = "Public DNS names of EC2 instance"
#   value = module.ec2_instances.*.public_dns
# }