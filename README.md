<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ./modules/ec2 | n/a |
| <a name="module_nat_gateway"></a> [nat\_gateway](#module\_nat\_gateway) | ./modules/nat_gateway | n/a |
| <a name="module_route_tables"></a> [route\_tables](#module\_route\_tables) | ./modules/route_tables | n/a |
| <a name="module_security_groups"></a> [security\_groups](#module\_security\_groups) | ./modules/security_groups | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy the resources | `string` | `"us-east-1"` | no |
| <a name="input_create_resources"></a> [create\_resources](#input\_create\_resources) | Whether to create the resources | `bool` | `true` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The name of the key pair for SSH access | `string` | n/a | yes |
| <a name="input_private_instance_count"></a> [private\_instance\_count](#input\_private\_instance\_count) | The number of private instances to deploy | `number` | `1` | no |
| <a name="input_public_instance_count"></a> [public\_instance\_count](#input\_public\_instance\_count) | The number of public instances to deploy | `number` | `1` | no |
| <a name="input_user_ip"></a> [user\_ip](#input\_user\_ip) | The IP address of the user for SSH access | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_instance_id"></a> [private\_instance\_id](#output\_private\_instance\_id) | The ID of the private EC2 instance |
| <a name="output_public_instance_public_ip"></a> [public\_instance\_public\_ip](#output\_public\_instance\_public\_ip) | The public IP of the public EC2 instance |
<!-- END_TF_DOCS -->