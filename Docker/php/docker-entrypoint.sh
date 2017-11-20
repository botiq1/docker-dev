#!/bin/bash

set -e

# Enable xdebug by ENV variable
if [ 0 -ne "${PHP_ENABLE_XDEBUG}" ] ; then
    docker-php-ext-enable xdebug
    echo "Enabled xdebug"
fi

exec "$@"
