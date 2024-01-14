#!/bin/sh

echo "starting git pull ..."
git pull

echo "starting compose down & up ..."
docker-compose down
docker-compose up -d --build

echo "starting sleep ..."
sleep 10

echo "starting laravel commands ..."
docker-compose run --rm artisan migrate
docker-compose run --rm artisan db:seed

# if need permission
# docker exec -it php sh
# chmod -R 775 /var/www/html/storage
# chmod -R 775 /var/www/html/bootstrap/cache
# chown -R laravel:laravel /var/www/html