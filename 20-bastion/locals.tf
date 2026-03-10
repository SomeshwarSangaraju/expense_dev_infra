locals{
    ami= data.aws_ami.ami.id
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.id
    public_subnet_ids = split("," , data.aws_ssm_parameter.public_subnet_ids.value)[0]
    tags={
        Name = "${var.project}-${var.environment}"
    }
}