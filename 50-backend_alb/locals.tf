locals{
    common_suffix_name = "${var.project}-${var.environment}"
    backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
    private_subnet_ids= split("," , data.aws_ssm_parameter.private_subnet_ids.value)
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_tags = {
        Project = "Roboshop"
        Environment = "dev"
        Terraform  = "true"
    }
}
