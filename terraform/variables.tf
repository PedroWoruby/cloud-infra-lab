##############################################
# Variáveis de entrada
##############################################

variable "aws_region" {
  description = "Região AWS (simulada pelo LocalStack)"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto, usado como prefixo/tag em todos os recursos"
  type        = string
  default     = "cloud-infra-lab"
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDRs das subnets públicas (uma por AZ)"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDRs das subnets privadas (uma por AZ)"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "availability_zones" {
  description = "Availability Zones usadas para distribuir as subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "allowed_ssh_cidr" {
  description = "Bloco CIDR autorizado a acessar a porta 22 (ajuste para o seu IP em um cenário real)"
  type        = string
  default     = "0.0.0.0/0" # OK em laboratório local; NUNCA use isso em produção real
}

variable "tags" {
  description = "Tags padrão aplicadas a todos os recursos"
  type        = map(string)
  default = {
    ManagedBy = "terraform"
    Project   = "cloud-infra-lab"
  }
}
