locals{
    ami_id = data.aws_ami.joindevops.id
    project = "roboshop"
    environemt = "dev"
    common_tags = {
        project = "roboshop"
        env = "dev"
        terraform = "true"
    }
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_id = data.aws_ssm_parameter.sg_id.value
    port_no = var.component == "frontend" ? 80 : 8080
    health_check_path = var.component == "frontend" ? "/" : "/health"
    listener_arn = var.component == "frontend" ? aws_ssm_parameter.frontend_listener_arn.value : aws_ssm_parameter.backend_listener_arn.value
    host_header = var.component == "frontend" ? ["${var.component}.${local.project}-${local.environment}-frontend-alb.${var.domain_name}"] : ["${var.component}.${local.project}-${local.environment}-backend-alb.${var.domain_name}"]
}