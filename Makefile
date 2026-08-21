.PHONY: up down apply destroy configure logs

up:
	docker compose up -d

down:
	docker compose down -v

apply:
	cd terraform && terraform init && terraform apply -auto-approve

destroy:
	cd terraform && terraform destroy -auto-approve

configure:
	cd ansible && ansible-galaxy collection install -r requirements.yml && ansible-playbook playbook.yml

logs:
	docker compose logs -f

deploy:
	./scripts/deploy.sh

teardown:
	./scripts/destroy.sh
