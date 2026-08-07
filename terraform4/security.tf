module "my_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 6.0"

  name            = "tf4-rackula-sg"
  use_name_prefix = false
  vpc_id          = module.my_vpc.vpc_id

  ingress_rules = {
    rackula = {
      cidr_ipv4   = "0.0.0.0/0"
      ip_protocol = "tcp"
      from_port   = var.rackula_port
      to_port     = var.rackula_port
    }
  }

  egress_rules = {
    all = { cidr_ipv4 = "0.0.0.0/0", ip_protocol = "-1" }
  }

  tags = { Name = "tf4-rackula-sg" }
}