resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, 0)
  security_groups = [var.security_group_id]

  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                echo "<html><body><h1>Instance IP: $(hostname -I | awk '{print $1}')</h1><h2>Health Status: OK</h2></body></html>" > /var/www/html/index.html
                systemctl start httpd
                systemctl enable httpd
              EOF

  tags = merge(
    {
      Name = var.instance_name
    },
    {
      "DynamicTag" = "App-${aws_instance.this.public_ip}"
    }
  )
}

output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value = aws_instance.this.public_ip
}