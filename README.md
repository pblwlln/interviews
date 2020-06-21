# Lemoney Test

## How to run

1. Second, run: `docker-compose run --rm web rake db:create`
2. Then, run: `docker-compose run --rm web rake db:migrate`
3. Last, run it: `docker-compose run --rm web rails assets:precompile`
4. First, run: `docker-compose up -d web`
5. Access `http://localhost:3000/offers` to manage offers
6. Access `http://localhost:3000/` to view them
