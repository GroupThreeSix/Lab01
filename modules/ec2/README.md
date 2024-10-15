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
| [aws_instance.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.amazon_linux_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The name of the key pair for SSH access | `string` | n/a | yes |
| <a name="input_private_instance_count"></a> [private\_instance\_count](#input\_private\_instance\_count) | The number of private instances to deploy | `number` | `1` | no |
| <a name="input_private_sg_id"></a> [private\_sg\_id](#input\_private\_sg\_id) | The ID of the private security group | `string` | n/a | yes |
| <a name="input_private_subnet_id"></a> [private\_subnet\_id](#input\_private\_subnet\_id) | The ID of the private subnet | `string` | n/a | yes |
| <a name="input_public_instance_count"></a> [public\_instance\_count](#input\_public\_instance\_count) | The number of public instances to deploy | `number` | `1` | no |
| <a name="input_public_sg_id"></a> [public\_sg\_id](#input\_public\_sg\_id) | The ID of the public security group | `string` | n/a | yes |
| <a name="input_public_subnet_id"></a> [public\_subnet\_id](#input\_public\_subnet\_id) | The ID of the public subnet | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_instance_id"></a> [private\_instance\_id](#output\_private\_instance\_id) | The ID of the private EC2 instance |
| <a name="output_public_instance_id"></a> [public\_instance\_id](#output\_public\_instance\_id) | The ID of the public EC2 instance |
| <a name="output_public_instance_public_ip"></a> [public\_instance\_public\_ip](#output\_public\_instance\_public\_ip) | The public IP of the public EC2 instance |
<!-- END_TF_DOCS -->