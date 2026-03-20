locals{
    ami_id = data.aws_ami.joindevops.id
    project = "roboshop"
    environment = "dev"
    common_tags = {
        project = "roboshop"
        env = "dev"
        terraform = "true"
    }
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    private_subnet_id = split(",",data.aws_ssm_parameter.private_subnet_id.value)[0]
    sg_id = data.aws_ssm_parameter.sg_id.value
    port_no = var.component == "frontend" ? 80 : 8080
    health_check_path = var.component == "frontend" ? "/" : "/health"
    listener_arn = var.component == "frontend" ? data.aws_ssm_parameter.frontend_listener_arn.value : data.aws_ssm_parameter.backend_listener_arn.value
    host_header = var.component == "frontend" ? ["${var.component}.${local.project}-${local.environment}-frontend-alb.${var.domain_name}"] : ["${var.component}.${local.project}-${local.environment}-backend-alb.${var.domain_name}"]
}