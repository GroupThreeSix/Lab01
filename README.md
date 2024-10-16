# Sử dụng Terraform để quản lý và triển khai hạ tầng AWS 


## Giới thiệu

Sử dụng Terraform để tự động hóa việc triển khai cơ sở hạ tầng AWS, bao gồm VPC, Subnets, Internet Gateway, NAT Gateway, EC2 instances và Security Groups.

## Cấu trúc project

```
.
├── 01-network.tf
├── 02-security_groups.tf
├── 03-keypair.tf
├── 04-ec2.tf
├── outputs.tf
├── provider.tf
├── variables.tf
├── version.tf
└── modules
    ├── ec2
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── keypair
    │   ├── main.tf
    │   ├── output.tf
    │   └── variables.tf
    ├── security_groups
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    └── vpc
        ├── main.tf
        ├── outputs.tf
        └── variables.tf
```

Project được tổ chức thành các module sau:

- `vpc`: Tạo VPC, Subnets, Internet Gateway và NAT Gateway
- `ec2`: Tạo EC2 instances
- `security_groups`: Tạo và quản lý Security Groups
- `keypair`: Quản lý SSH key pairs


## Hạ tầng sẽ triển khai
1. VPC với Public và Private Subnets
2. Internet Gateway cho Public Subnet
3. NAT Gateway cho Private Subnet
4. Route Tables cho Public và Private Subnets
5. EC2 instances trong Public và Private Subnets
6. Security Groups cho EC2 instances
7. Tự động tạo và quản lý SSH key pairs

![image](https://media.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Ftm86cvxzndy4c4e5dw75.png)

## Yêu cầu

- Terraform (phiên bản >= 0.12)
- AWS CLI đã được cấu hình với thông tin đăng nhập hợp lệ.

## Cách sử dụng

1. Clone repository này về máy local của bạn.

2. Điều chỉnh các biến trong file `terraform.tfvars` theo nhu cầu của bạn dựa vào file `variables.tf`.

3. Khởi tạo Terraform:

   ```
   terraform init
   ```

4. Sử dụng lệnh để format code theo chuẩn terraform:   

   ```
   terraform fmt
   ```

5. Xem trước các thay đổi:

   ```
   terraform plan
   ```

5. Áp dụng cấu hình:

   ```
   terraform apply
   ```

6. Khi muốn xóa toàn bộ tài nguyên:

   ```
   terraform destroy
   ```

## Lưu ý bảo mật

- Đảm bảo rằng bạn không chia sẻ file `.tfstate` hoặc bất kỳ file nào chứa thông tin nhạy cảm.
- Sử dụng biến `user_ip` để giới hạn truy cập SSH vào EC2 instance công khai.