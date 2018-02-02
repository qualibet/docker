#!/bin/bash
# example: docker exec -it qualibet bash -c 'export PHP_IDE_CONFIG="serverName=clidebug"; php `which phpunit` /var/www/html/qualibet/jobs/tests/Crons/ErpExport/Etos.php'

docker exec -it qualibet bash -c "export PHP_IDE_CONFIG=serverName=$1; php $2 $3"
