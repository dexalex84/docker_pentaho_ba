#  Pentaho BA 7.0 CE on Docker
 

This is a project with Pentaho BA 7.0 CE deployed on docker

## Folders:

- init
   - db_repo - sql files to create Pentaho BA repo DB
   - app_pentaho_ba - files with final Pentaho BA absolute PATH to customize Server

- distr - folder with distributive of Pentaho BA (empty on github - need to put file if needed)

## Services:
1) db_repo - PostgreSQL DB (latest version) from docker hub
   admin: postgres
   created db
     - postgres
     - repo   - Pentaho BA system DB
     - quartz - Pentaho BA system DB
  
2) app_pentaho_ba - Penatho BA 7.0
   
   web: http://docker_host_ip:8080/pentaho/Home
   docker_host_ip - IP of host machine where was installed Docker

## Instructions:
1) Install docker
2) clone repository to local folder
3) run docker-compose up -d to  (downloading necessary data and starting containers)
4) run ./prepare_environment.sh (creating DB repo and customizing defaults to work with PostgreSQL)
5) run docker-compose exec app_pentaho_ba ./start_pentaho.sh (starting BA web server)

## Customizing tips:
Dockerfile can work in two ways
1) using downloaded archive with Pentaho BA 7.0 CE

   Uncomment these rows
```
    RUN echo "Get Pentaho BA CE distributive from host docker folder (for fast start and debug)"
    COPY /distr/pentaho-server-ce-7.0.0.0-25.zip /opt/pentaho/
```
2) using distributive downloaded from sourceforge (default)

   Uncomment these rows 
``` 
   RUN echo "Get Pentaho BA CE distributive from sourceforge"
   RUN wget -O pentaho-server-ce-7.0.0.0-25.zip https://sourceforge.net/projects/pentaho/files/Business%20Intelligence%20Server/7.0/pentaho-server-ce-7.0.0.0-25.zip \
    --progress=bar:force
```
 
 ## Troubleshooting:
 
 Need to wait about 5-7 minutes on 1 start. If there is nothing on web http://docker_host_ip:8080/pentaho/Home:
  - Connect to app_pentaho_ba via command: 
 
    `docker-compose exec app_pentaho_ba  /bin/bash`
    
  - Check logs:
  
    `tail -f tomcat/logs/catalina.out`

    or from host:
   
    
    `docker-compose exec app_pentaho_ba tail -f tomcat/logs/catalina.out`


    Also possible to stop 
    

    `./stop-pentaho.sh`


     and start debug version of service 
     

    `./start-pentaho-debug.sh`

     
 ## Related docs:
 Instructon for installing Pentaho BA CE on CentOS [To Gist](https://gist.github.com/dexalex84/334bdd189dd923a63e80c45300fb30be)

 
