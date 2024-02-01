jwt:
	@echo "Generating JWT"
	@chmod +x ./gen-secret.sh
	@./gen-secret.sh

folders:
	@echo "Creating reth folders"
	@chmod +x ./gen-dirs.sh
	@./gen-dirs.sh

start:
	docker compose up -d $(ARGS)

stop:
	docker compose down