optimize:
	docker compose exec app php artisan optimize

migrate:
	docker compose exec app php artisan migrate:fresh

restart-full:
	docker compose down
	docker compose up -d --build
