#!/bin/bash
wp core download --allow-root \
    && wp config create --dbname=app --dbuser=db_user --dbpass=db_pass --dbhost=mysql --allow-root \
    && wp core install --url=app.wp --title=App --admin_user=admin --admin_password=default --admin_email=user@localhost.local --skip-email --allow-root