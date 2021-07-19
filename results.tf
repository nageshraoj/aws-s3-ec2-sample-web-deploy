output "s3web_endpoint" {
  description = "S3 Website endpoint"
  value       = aws_s3_bucket.demobucket.website_endpoint
}

output "ec2_public_ip" {
  description = "EC2 public ip"
  value       = aws_instance.demoec2.public_ip
}

output "ec2_private_ip" {
  description = "EC2 private ip"
  value       = aws_instance.demoec2.private_ip
}