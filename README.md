# Install
    - create folder qualibet or what ever folder you want for the project and cd in 
    - git clone git@github.com:qualibet/cs-backend.git
    - git clone git@github.com:qualibet/myplace-backend.git
    - git clone git@github.com:qualibet/worker.git
    - git clone git@github.com:qualibet/api.git
    - copy docker-compose.yml.example to docker-compose.yml
    - change <UBUNTU-USER-NAME> with your username
    - if you dont choose qualibet as your project folder-name, you need to change the name also
    - add to your hosts
    - 127.0.0.1       api.test
    - 127.0.0.1       cs-backend.test
    - 127.0.0.1       myplace-backend.test
    - 127.0.0.1       worker.test  
  
# Usage
    - docker-compose up -d
    - docker exec -it qualibet-php bash
    - sites: api.test / cs-backend.test / myplace-backend.test / worker.test
    - mysql: localhost:9911 user: root pw:

# up envirioment
* create DB for project `dev`
use qualibet worker branch / PR 256 >> qb1833 for migrations
```bash
docker exec -it qualibet-php bash
php ./worker/artisan migrate && php ./worker/artisan migrate --seed
```
* and update user settings
```mysql
UPDATE `admin_users` SET `is_service` = '1', `is_admin` = '1' WHERE (`id` = '1');
```

* set up .env file
  - set up correct DB name
  - set up evirioment.env 
```dotenv
QB_WORKER_ENVIRONMENT=dev
```
  
* run bash on qualibet-php  
* run composer install on projects dirs
update access rights 
```
chmod 777 api/bootstrap/cache/
chmod 777 cs-backend/bootstrap/cache/
chmod 777 myplace-backend/bootstrap/cache/
chmod 777 worker/bootstrap/cache/
```


# xdebug
    - server: docker
    - IDE Key: PHPSTORM
    - HOST: 127.0.0.1 PORT: 80
    
#### FAQ/Troubleshoting
* in case of error with creating qualibet-php remove docker images abd before docker-compose up run build
```bash
docker-compose build
```
  
* in case docker error:  
> "listen tcp 0.0.0.0:80: bind: address already in use"

try to update ports on docker-compose from 80:80 to 8080:80
```
webserver: 
    ports:
       - "8080:80"
```

* in case ip/domain access error via 127.0.0.1 fix ip in /etc/hosts:  
```bash
docker ps
docker inspect {CONTAINER ID qualibet-webserver} | grep "IPAddress"
```