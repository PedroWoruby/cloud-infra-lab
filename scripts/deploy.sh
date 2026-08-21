#!/usr/bin/env bash
# deploy.sh — sobe o laboratório inteiro do zero
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "==> 1/4 Subindo containers (LocalStack, servidores, monitoramento)..."
docker compose up -d

echo "==> 2/4 Aguardando o LocalStack ficar saudável..."
until curl -sf http://localhost:4566/_localstack/health > /dev/null; do
  printf '.'
  sleep 2
done
echo " ok"

echo "==> 3/4 Provisionando infraestrutura com Terraform..."
pushd terraform > /dev/null
terraform init
terraform apply -auto-approve
popd > /dev/null

echo "==> 4/4 Configurando servidores com Ansible..."
pushd ansible > /dev/null
ansible-galaxy collection install -r requirements.yml
ansible-playbook playbook.yml
popd > /dev/null

cat <<'EOF'

Laboratório no ar!

  Servidor web-01 ......... http://localhost:8081
  Servidor web-02 ......... http://localhost:8082
  Prometheus .............. http://localhost:9090
  Grafana (admin/admin) ... http://localhost:3000
  LocalStack (AWS fake) .... http://localhost:4566

Rode ./scripts/destroy.sh quando quiser derrubar tudo.
EOF
