
start:
	docker-compose up

startd:
	docker-compose up -d

stop:
	docker-compose stop

reset:
	docker-compose rm
	rm -rf ./data/ || true 
	mkdir -p ./data/
	cp priv_validator_state.json ./data

restart: reset start
