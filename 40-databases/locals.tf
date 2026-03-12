locals{
    ami_id = data.aws_ami.joindevops.id
    database_subnet_ids = split("," , data.aws_ssm_parameter.database_subnet_ids.value)[0]
    mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
    common_tags={
        Project = "Expense"
        Environment = "dev"
        Terraform = "true"
    }
    common_suffix_name = "${var.project}-${var.environment}"
}