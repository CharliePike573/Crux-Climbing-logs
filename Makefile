setup:
	docker-compose build
	docker-compose run --rm web bash -c 'sleep 20 && bin/setup' # wait for database

migrate:
	docker-compose run --rm web bundle exec rails db:migrate
	docker-compose run --rm web bundle exec rails db:schema:load RAILS_ENV=test

s:
	docker-compose up

c:
	docker-compose run --rm web bundle exec rails c

rebuild:
	docker-compose run --rm web bundle install
	docker-compose build

test:
	docker-compose run --rm web bash -c "bundle exec rubocop && bundle exec rspec"

rspec:
	docker-compose run --rm web bundle exec rspec

rubocop:
	docker-compose run --rm web bundle exec rubocop

seed:
	docker-compose run --rm web bash -c "rm -rf /app/public/uploads"
	docker-compose run --rm web bundle exec rails db:reset

bash:
	docker-compose run --rm web bash
