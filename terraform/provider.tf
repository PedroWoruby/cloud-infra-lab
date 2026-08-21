##############################################
# Provider: AWS apontando para o LocalStack
##############################################
# O LocalStack sobe uma "AWS falsa" na sua máquina (via Docker), respondendo
# aos mesmos endpoints da API real. Isso permite escrever Terraform 100%
# compatível com AWS de verdade, mas sem gastar nada e sem precisar de
# conta/cartão de crédito. Quando você tiver uma conta AWS real, basta
# remover o bloco "endpoints" abaixo para apontar para a AWS de verdade.

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  # Credenciais fake — o LocalStack não valida essas chaves, mas o provider
  # AWS exige que alguma coisa esteja preenchida.
  access_key = "test"
  secret_key = "test"

  # Evita chamadas desnecessárias que só fazem sentido contra a AWS real
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    ec2            = "http://localhost:4566"
    s3             = "http://localhost:4566"
    iam            = "http://localhost:4566"
    sts            = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    cloudwatchlogs = "http://localhost:4566"
    logs           = "http://localhost:4566"
  }
}
