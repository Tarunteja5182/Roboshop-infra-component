data "aws_ami" "joindevops" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
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

data "aws_ssm_parameter" "vpc_id"{
    name = "/${local.project}/${local.environment}/vpc_id"
}

data "aws_ssm_parameter" "private_subnet_id"{
    name = "/${local.project}/${local.environment}/private_subnet_id"
}

data "aws_ssm_parameter" "sg_id"{
    name = "/${local.project}/${local.environment}/${var.component}"
}

data "aws_ssm_parameter" "frontend_listener_arn"{
     name = "/${local.project}/${local.environment}/frontend_listener_arn"
}

data "aws_ssm_parameter" "backend_listener_arn"{
     name = "/${local.project}/${local.environment}/backend_listener_arn"
}
