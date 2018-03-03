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