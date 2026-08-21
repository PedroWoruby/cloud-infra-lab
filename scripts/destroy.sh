#!/usr/bin/env bash
# destroy.sh — derruba tudo e limpa o ambiente
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "==> Destruindo infraestrutura Terraform..."
pushd terraform > /dev/null
terraform destroy -auto-approve || true
popd > /dev/null

echo "==> Derrubando containers..."
docker compose down -v

echo "Ambiente limpo."
