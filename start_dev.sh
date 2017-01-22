#!/usr/bin/env bash
rm Gemfile.lock
touch Gemfile.lock
docker-compose pull
docker-compose up -d mariadb
sleep 10
docker-compose build
docker-compose run cafmal-api rake db:reset
docker-compose up
