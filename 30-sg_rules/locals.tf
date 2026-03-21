locals{
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
    mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
    backend_sg_id = data.aws_ssm_parameter.backend_sg_id.value
    frontend_sg_id = data.aws_ssm_parameter.frontend_sg_id.value
    frontend_alb_sg_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
    backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
    open_vpn_sg_id = data.aws_ssm_parameter.open_vpn_sg_id.value

    common_tags={
        Project = "Expense"
        Environment = "dev"
        Terraform = "true"
    }
    common_suffix_name = "${var.project}-${var.environment}"
}