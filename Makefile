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
	docker compose stop

clean:
	@sudo rm -rf rethdata
	@sudo rm -rf rethlogs
	@sudo rm -rf magilogs

build:
	docker compose build