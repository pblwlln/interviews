# Lemoney Test

## How to run

1. First, run: `docker-compose up -d web`
1. Then run: `docker-compose run --rm web rake db:create`
1. Last, run it: `docker-compose run --rm web rake db:migrate`
1. Access `http://localhost:3000`
