# Jenkins Installation on AWS EC2 using Terraform

This repository contains Terraform scripts to deploy Jenkins on an EC2 instance running Amazon Linux on AWS.

## Prerequisites

Before you begin, make sure you have the following:

- An AWS account
- Terraform installed on your local machine
- An SSH key pair created in your AWS account

## Setup

1. Clone this repository:

```bash
git clone https://github.com/abila98/Terraform_Jenkins.git
cd Terraform_Jenkins
```

2. Update the `region` variable in `terraform.tfvars` to your desired AWS region.

3. Update the `ami` variable in `terraform.tfvars` to a free Amazon Linux AMI ID available in your desired AWS region.

4. Update the `aws_key` variable in `terraform.tfvars` with the name of your SSH key pair.

## Usage

1. Initialize Terraform:

```bash
terraform init
```

2. Plan the deployment to review the changes Terraform will make:

```bash
terraform plan
```

3. Apply the Terraform configuration to create the resources:

```bash
terraform apply
```

Confirm the apply of resources by typing yes when prompted.

4. After the deployment is complete, SSH into the EC2 instance:

```bash
ssh -i /path/to/your/private/key.pem ec2-user@<EC2_Instance_IP>
```

5. Retrieve the Jenkins initial admin password by running the following command on the EC2 instance:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

6. Access Jenkins by navigating to http://<EC2_Instance_IP>:8080 in your web browser and input the password that you got from the previous step

## Cleaning Up

To delete the resources created by Terraform and avoid incurring additional costs, run:

```bash
terraform destroy
```

Confirm the destruction of resources by typing `yes` when prompted.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
