# Lemoney Test

## To run this project, execute the following commands in your terminal

1. `docker-compose run --rm web rake db:create`
2. `docker-compose run --rm web rake db:migrate`
3. `docker-compose run --rm web rails assets:precompile`
4. `docker-compose up -d web`

## To check out this feature

1. Access `http://localhost:3000/offers` to manage offers
2. Access `http://localhost:3000/` to view them
