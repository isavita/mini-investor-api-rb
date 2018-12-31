.PHONY: dev setup

dev:
	@docker-compose down && \
		docker-compose build --no-cache --pull && \
		docker-compose run api bundle exec rails db:migrate && \
		docker-compose up -d && \
		echo "You can visit localhost:8080 from your browser"

setup:
	@docker-compose build --no-cache --pull && \
		docker-compose run api bundle exec rails db:setup && \
		docker-compose up -d && \
		echo "You can visit localhost:8080 from your browser"
