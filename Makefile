jwt:
	@echo "Generating JWT"
	@chmod +x ./gen-secret.sh
	@./gen-secret.sh

start:
	docker-compose up -d

stop:
	docker-compose down