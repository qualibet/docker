#!/bin/bash
# example: docker exec -it qualibet bash -c 'export PHP_IDE_CONFIG="serverName=clidebug"; php /var/www/html/qualibet/jobs/tests/Crons/ErpExport/Etos.php'
# example call sh dockerCliDebug.sh clidebug /var/www/html/qualibet/dummy.php
docker exec -it qualibet bash -c "export PHP_IDE_CONFIG=serverName=$1; php $2"
