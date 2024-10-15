<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_ingress_rules"></a> [private\_ingress\_rules](#input\_private\_ingress\_rules) | List of ingress rules for private security group | <pre>list(object({<br/>    description     = string<br/>    from_port       = number<br/>    to_port         = number<br/>    protocol        = string<br/>    security_groups = list(string)<br/>  }))</pre> | <pre>[<br/>  {<br/>    "description": "SSH from public instance",<br/>    "from_port": 22,<br/>    "protocol": "tcp",<br/>    "security_groups": [],<br/>    "to_port": 22<br/>  }<br/>]</pre> | no |
| <a name="input_public_ingress_rules"></a> [public\_ingress\_rules](#input\_public\_ingress\_rules) | List of ingress rules for public security group | <pre>list(object({<br/>    description = string<br/>    from_port   = number<br/>    to_port     = number<br/>    protocol    = string<br/>    cidr_blocks = list(string)<br/>  }))</pre> | <pre>[<br/>  {<br/>    "cidr_blocks": [],<br/>    "description": "SSH from user IP",<br/>    "from_port": 22,<br/>    "protocol": "tcp",<br/>    "to_port": 22<br/>  }<br/>]</pre> | no |
| <a name="input_user_ip"></a> [user\_ip](#input\_user\_ip) | The IP address of the user for SSH access | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_sg_id"></a> [private\_sg\_id](#output\_private\_sg\_id) | The ID of the private security group |
| <a name="output_public_sg_id"></a> [public\_sg\_id](#output\_public\_sg\_id) | The ID of the public security group |
<!-- END_TF_DOCS -->